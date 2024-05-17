# In this file you must implement your main query methods
# so they can be used by your database models to interact with your bot.

import os
from pymysql import DatabaseError
import pymysql.cursors

#TODO: add the values for these database keys in your secrets on replit
db_host = os.environ["DB_HOST"]
db_username = os.environ["DB_USER"]
db_password = os.environ["DB_PASSWORD"]
db_name = os.environ["DB_NAME"]


class Database:

  # This method was already implemented for you
  def connect(self):
    """
        This method creates a connection with your database
        IMPORTANT: all the environment variables must be set correctly
                   before attempting to run this method. Otherwise, it
                   will throw an error message stating that the attempt
                   to connect to your database failed.
        """
    try:
      conn = pymysql.connect(host=db_host,
                             port=3306,
                             user=db_username,
                             password=db_password,
                             db=db_name,
                             charset="utf8mb4",
                             cursorclass=pymysql.cursors.DictCursor)
      print("Bot connected to database {}".format(db_name))
      return conn
    except ConnectionError as err:
      print(f"An error has occurred: {err.args[1]}")
      print("\n")

  #TODO: needs to implement the internal logic of all the main query operations
  def get_response(self, query, values=None, fetch=False, many_entities=False):
    response = None
    connection = self.connect()
    cursor = connection.cursor()
    if values:
      if many_entities:
        cursor.executemany(query, values)
      else:
        cursor.execute(query, values)
    else:
      cursor.execute(query)

    connection.commit()
    connection.close()
    if fetch:
      response = cursor.fetchall()
    return response

  # the following methods were already implemented for you.
  @staticmethod
  def select(query, values=None, fetch=True):
    database = Database()
    return database.get_response(query, values=values, fetch=fetch)

  @staticmethod
  def insert(query, values=None, many_entities=False):
    database = Database()
    return database.get_response(query,
                                 values=values,
                                 many_entities=many_entities)

  @staticmethod
  def insert_and_return_new_id(query, values=None, many_entities=False):
    connection = None
    try:
      connection = Database().connect()
      with connection.cursor() as cursor:
        if many_entities:
          cursor.executemany(query, values)
        else:
          cursor.execute(query, values)
        connection.commit()
        cursor.execute(Query.SELECT_LAST_INSERT_ID)
        result = cursor.fetchone()
        new_id = result['id']
      return new_id
    except DatabaseError as db_err:
      if connection:
        connection.rollback()
      print(f"Failed to insert into the database. Error: {db_err}")
      return None
    finally:
      if connection:
        connection.close()

  @staticmethod
  def update(query, values=None):
    database = Database()
    return database.get_response(query, values=values)

  @staticmethod
  def delete(query, values=None):
    database = Database()
    return database.get_response(query, values=values)


class Query:
  # Retrieve the name and location of a hospital based on the hospital ID provided
  GET_HOSPITAL_BY_ID = """SELECT 
      Hospital.name, 
      Hospital.location 
  FROM 
      Hospital 
  WHERE 
      Hospital.hospital_id = %s
  """

  # Retrieve all hospitals data entries
  GET_ALL_HOSPITALS = """SELECT * FROM Hospital"""

  # Retrieve all patient data entries
  GET_ALL_PATIENTS = """SELECT * FROM Patient"""

  # Retrieve a patient's data based on the ID provided
  GET_PATIENT_BY_ID = """SELECT
      patient_id,
      patient_name,
      patient_DOB,
      contact_number
  FROM
      Patient
  WHERE 
      Patient.patient_id = %s
  """

  # Retrieve employee details based on the employee ID provided
  GET_EMPLOYEE_BY_ID = """SELECT
    e.employee_id,
    e.employee_name,
    e.email,
    e.bio,
    h.name AS hospital,
    d.name AS department
  FROM
    Employee e
    LEFT JOIN Hospital h ON e.hospital = h.hospital_id
    LEFT JOIN Department d ON e.department = d.department_id
  WHERE employee_id = %s
  """

  # Query for adding a new hospital to the table
  INSERT_HOSPITAL = """INSERT INTO Hospital (name, location) VALUES (%s, %s)"""

  # Retrieve the last inserted ID generated by an AUTO_INCREMENT column in MySQL
  SELECT_LAST_INSERT_ID = """SELECT LAST_INSERT_ID() AS id"""

  # Procedure that retrieves a doctor's full schedule for a specific day.
  GET_DOCTOR_APPOINTMENT_FOR_DAY = """CALL GetDoctorScheduleForDay(%s, %s)"""

  # Retrieve information of all medications.
  GET_ALL_MEDICATIONS = """SELECT 
    m.medication_id, 
    m.name, 
    ps.pharmacy_staff_id AS  managed_by_pharmacy_staff_id,
    e.employee_name AS managed_by_pharmacy_staff_name, 
    m.type, 
    m.expiration_date, 
    m.stock_level
  FROM 
      Medication m
  LEFT JOIN 
      PharmacyStaff ps ON m.managed_by = ps.pharmacy_staff_id
  LEFT JOIN 
      Employee e ON ps.pharmacy_staff_id = e.employee_id
  """

  # Select a medication record by its ID from the database.
  GET_MEDICATION_BY_ID = """SELECT 
    m.medication_id, 
    m.name, 
    ps.pharmacy_staff_id AS  managed_by_pharmacy_staff_id,
    e.employee_name AS managed_by_pharmacy_staff_name, 
    m.type, 
    m.expiration_date, 
    m.stock_level
  FROM 
      Medication m
  LEFT JOIN 
      PharmacyStaff ps ON m.managed_by = ps.pharmacy_staff_id
  LEFT JOIN 
      Employee e ON ps.pharmacy_staff_id = e.employee_id
  WHERE medication_id = %s
  """

  UPDATE_MEDICATION_STOCK_LEVEL = """UPDATE Medication 
  SET stock_level = %s 
  WHERE medication_id = %s
  """
  # Add queries for Doctor
  GET_DOCTOR_BY_ID = """SELECT
      doctor_id,
      specialization,
      license_number
  FROM
      Doctor
  WHERE 
      doctor_id = %s
  """

  GET_ALL_DOCTORS = """SELECT 
      doctor_id,
      specialization,
      license_number
  FROM
      Doctor
  """

  INSERT_DOCTOR = """INSERT INTO Doctor (doctor_id, specialization, license_number) 
                     VALUES (%s, %s, %s)
  """

  DELETE_DOCTOR = """DELETE FROM Doctor 
                     WHERE doctor_id = %s
  """

  GET_READMISSION_INFO = """CALL GetReadmissionInfo(%s)"""

  CALL_GET_PATIENT_DETAILS = """CALL GetPatientDetails(%s)"""

  CALL_GET_EMPLOYEE_COUNT_BY_DEPARTMENT = """SELECT GetEmployeeCountByDepartment(%s) AS emp_count"""

  CALL_GET_EQUIPMENT_UTILIZATION_RATES = """CALL GetEquipmentUtilizationRates(%s, %s)"""

  CALL_GET_DEPARTMENTS_BY_APPOINTMENT_COUNT = """CALL GetDepartmentsByAppointmentCount()"""

  CALL_GET_PATIENT_COUNT_BY_INSURANCE_PLAN = """CALL GetPatientCountByInsurancePlan(%s)"""

  CALL_GET_DEPARTMENTS_WITH_LONG_TENURED_EMPLOYEES = """CALL GetDepartmentsWithLongTenuredEmployees()"""

  CALL_GET_TOTAL_MEDICATIONS_MANAGED_BY_EACH_PHARMACY_STAFF = """CALL GetTotalMedicationsManagedByEachPharmacyStaff()"""

  CALL_GET_MONTHLY_APPOINTMENTS_COUNT = """CALL GetMonthlyAppointmentsCount()"""

  CALL_GET_PATIENT_MEDICAL_HISTORY = """CALL GetPatientMedicalHistory(%s)"""

  GET_APPOINTMENT_DETAILS = """
  SELECT 
      Appointment.appointment_id,
      Patient.patient_name,
      Employee.employee_name AS doctor_name,
      Department.name AS department_name,
      Equipment.name AS equipment_name,
      Appointment.appointment_date,
      Appointment.appointment_time
  FROM 
      Appointment
  JOIN 
      Patient ON Appointment.patient = Patient.patient_id
  LEFT JOIN 
      Doctor ON Appointment.doctor = Doctor.doctor_id
  LEFT JOIN 
      Employee ON Doctor.doctor_id = Employee.employee_id
  LEFT JOIN 
      Equipment ON Appointment.equipment = Equipment.equipment_id
  LEFT JOIN 
      Department ON Equipment.department = Department.department_id
  ORDER BY 
      Appointment.appointment_date, Appointment.appointment_time;
  """

  # Query to retrieve medications that are near expiration (within 30 days)
  GET_MEDICATIONS_NEAR_EXPIRATION = """
  SELECT 
      m.name,
      m.expiration_date
  FROM 
      Medication m
  HAVING 
      m.expiration_date < CURDATE() + INTERVAL 30 DAY
  """
