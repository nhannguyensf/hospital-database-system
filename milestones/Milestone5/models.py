"""
In this file you must implement all your database models.
If you need to use the methods from your database.py call them
statically. For instance:
       # opens a new connection to your database
       connection = Database.connect()
       # closes the previous connection to avoid memory leaks
       connection.close()
"""
from database import Database, Query
from pymysql import DatabaseError


class TestModel:
  """
    This is an object model example. Note that
    this model doesn't implement a DB connection.
    """

  def __init__(self, ctx):
    self.ctx = ctx
    self.author = ctx.message.author.name

  def response(self):
    return f'Hi, {self.author}.\nBot is connected to Replit!'


class ModelInterface:
  """
   This method will be implemented to syncronize data from the database 
   """

  def __init__(self) -> None:
    self.was_deleted = False

  def synchronize(self):
    pass

  def signin(organization):
    pass

  def update(self, attribute, value):
    pass

  def delete(self):
    pass

  @staticmethod
  def add(data):
    pass

  @staticmethod
  def get(value):
    pass

  @staticmethod
  def get_all():
    pass


class HospitalModel(ModelInterface):
  """Usage example: 
  hospital = HospitalModel.get("1")
  """

  def __init__(self, id=None) -> None:
    super().__init__()
    self.name = None
    self.location = None
    self.id = id

  @staticmethod
  def get_all():
    try:
      hospitals_data = Database.select(Query.GET_ALL_HOSPITALS)
      hospitals = []
      if hospitals_data:
        for row in hospitals_data:
          hospital = HospitalModel(row['hospital_id'])
          hospital.name = row['name']
          hospital.location = row['location']
          hospitals.append(hospital)
      return hospitals
    except DatabaseError as db_err:
      print(f"Failed to retrieve hospitals. Error: {db_err}")
      return None

  @staticmethod
  def get(value):
    id = value
    try:
      hospital = HospitalModel(id)
      hospital_data = Database.select(Query.GET_HOSPITAL_BY_ID, (id))
      if hospital_data:
        for values in hospital_data:
          hospital.name = values['name']
          hospital.location = values['location']
          return hospital
      return None
    except DatabaseError as db_err:
      print(
          f"Hospital {id} couldn't be retreived from database. \n Error: {db_err.args[1]}"
      )
      return None

  @staticmethod
  def add(data):
    name = data.get('name')
    location = data.get('location')
    try:
      new_id = Database.insert_and_return_new_id(Query.INSERT_HOSPITAL,
                                                 (name, location))
      if new_id:
        new_hospital = HospitalModel(new_id)
        new_hospital.name = name
        new_hospital.location = location
        return new_hospital
      return None
    except DatabaseError as db_err:
      print(f"Failed to add hospital to the database. Error: {db_err}")
      return None


class DepartmentModel(ModelInterface):

  @staticmethod
  def get_departments_by_appointment_count():
    try:
      results = Database.select(
          Query.CALL_GET_DEPARTMENTS_BY_APPOINTMENT_COUNT)
      return results
    except DatabaseError as db_err:
      print(
          f"Failed to retrieve departments by appointment count. Error: {db_err}"
      )
      return None

  @staticmethod
  def get_departments_with_long_tenured_employees():
    try:
      results = Database.select(
          Query.CALL_GET_DEPARTMENTS_WITH_LONG_TENURED_EMPLOYEES)
      return results
    except DatabaseError as db_err:
      print(
          f"Failed to retrieve departments with long-tenured employees. Error: {db_err}"
      )
      return None


class EmployeeModel(ModelInterface):

  def __init__(self, id=None) -> None:
    super().__init__()
    self.employee_id = id
    self.employee_name = None
    self.hospital = None
    self.department = None
    self.bio = None
    self.email = None

  """Usage example: 
    employee = EmployeeModel.get("1")
    """

  @staticmethod
  def get(value):
    id = value
    try:
      employee = EmployeeModel(id)
      employee_data = Database.select(Query.GET_EMPLOYEE_BY_ID, (id))
      if employee_data:
        for values in employee_data:
          employee.employee_name = values['employee_name']
          employee.hospital = values['hospital']
          employee.department = values['department']
          employee.bio = values['bio']
          employee.email = values['email']
        return employee
      return None
    except DatabaseError as db_err:
      print(
          f"Employee {id} couldn't be retrieved from the database. \n Error: {db_err.args[1]}"
      )
      return None

  @staticmethod
  def get_employee_count_by_department(department_id):
    try:
      results = Database.select(Query.CALL_GET_EMPLOYEE_COUNT_BY_DEPARTMENT,
                                (department_id, ))
      if results:
        count = results[0]['emp_count']
        return count
      return 0
    except DatabaseError as db_err:
      print(
          f"Failed to retrieve employee count for department ID {department_id}. Error: {db_err}"
      )
      return None


class PatientModel(ModelInterface):
  """Usage example: 
      patient = PatientModel.get("1")
      """

  def __init__(self, id=None) -> None:
    super().__init__()
    self.patient_id = id
    self.patient_name = None
    self.patient_DOB = None
    self.contact_number = None

  @staticmethod
  def get(value):
    id = value
    try:
      patient = PatientModel(id)
      patient_data = Database.select(Query.GET_PATIENT_BY_ID, (id))
      if patient_data:
        for values in patient_data:
          patient.patient_name = values['patient_name']
          patient.patient_DOB = values['patient_DOB']
          patient.contact_number = values['contact_number']
        return patient
      return None
    except DatabaseError as db_err:
      print(
          f"Patient {id} couldn't be retrieved from the database. \n Error: {db_err.args[1]}"
      )
      return None

  @staticmethod
  def get_all():
    try:
      patients_data = Database.select(Query.GET_ALL_PATIENTS)
      patients = []
      if patients_data:
        for row in patients_data:
          patient = PatientModel(row['patient_id'])
          patient.patient_name = row['patient_name']
          patient.patient_DOB = row['patient_DOB']
          patient.contact_number = row['contact_number']
          patients.append(patient)
      return patients
    except DatabaseError as db_err:
      print(f"Failed to retrieve patients. Error: {db_err}")
      return None

  @staticmethod
  def get_readmission_info(patient_id):
    try:
      readmission_data = Database.select(Query.GET_READMISSION_INFO,
                                         (patient_id, ))
      if readmission_data:
        return readmission_data
      return None
    except DatabaseError as db_err:
      print(
          f"Failed to retrieve readmission info for patient with ID {patient_id}. Error: {db_err}"
      )
      return None

  @staticmethod
  def get_patient_details(patient_id):
    try:
      details = Database.select(Query.CALL_GET_PATIENT_DETAILS, (patient_id, ))
      if details:
        return details
      return None
    except DatabaseError as db_err:
      print(
          f"Failed to retrieve details for patient ID {patient_id}. Error: {db_err}"
      )
      return None

  @staticmethod
  def get_medical_history(patient_id):
    try:
      history_data = Database.select(Query.CALL_GET_PATIENT_MEDICAL_HISTORY,
                                     (patient_id, ))
      return history_data
    except DatabaseError as db_err:
      print(
          f"Failed to retrieve medical history for patient with ID {patient_id}. Error: {db_err}"
      )
      return None


class DoctorModel(ModelInterface):
  """ Model class for Doctor """

  def __init__(self, doctor_id=None):
    super().__init__()
    self.doctor_id = doctor_id
    self.specialization = None
    self.license_number = None

  @staticmethod
  def get(doctor_id):
    try:
      doctor_data = Database.select(Query.GET_DOCTOR_BY_ID, (doctor_id, ))
      if doctor_data:
        row = doctor_data[0]
        doctor = DoctorModel(row['doctor_id'])
        doctor.specialization = row['specialization']
        doctor.license_number = row['license_number']
        return doctor
      return None
    except DatabaseError as db_err:
      print(f"Failed to retrieve doctor with ID {doctor_id}. Error: {db_err}")
      return None

  @staticmethod
  def get_all():
    try:
      doctors_data = Database.select(Query.GET_ALL_DOCTORS)
      doctors = []
      if doctors_data:
        for row in doctors_data:
          doctor = DoctorModel(row['doctor_id'])
          doctor.specialization = row['specialization']
          doctor.license_number = row['license_number']
          doctors.append(doctor)
      return doctors
    except DatabaseError as db_err:
      print(f"Failed to retrieve doctors. Error: {db_err}")
      return None

  @staticmethod
  def add(data):
    doctor_id = data.get('doctor_id')
    specialization = data.get('specialization')
    license_number = data.get('license_number')
    try:
      new_id = Database.insert_and_return_new_id(
          Query.INSERT_DOCTOR, (doctor_id, specialization, license_number))
      if new_id:
        new_doctor = DoctorModel(new_id)
        new_doctor.specialization = specialization
        new_doctor.license_number = license_number
        return new_doctor
      return None
    except DatabaseError as db_err:
      print(f"Failed to add doctor to the database. Error: {db_err}")
      return None

  def delete(self):
    try:
      Database.delete(Query.DELETE_DOCTOR, (self.doctor_id, ))
      self.was_deleted = True
      return True
    except DatabaseError as db_err:
      print(
          f"Failed to delete doctor with ID {self.doctor_id}. Error: {db_err}")
      return False


class MedicationModel(ModelInterface):
  """ Model class for Medication """

  def __init__(self, id=None):
    super().__init__()
    self.medication_id = id
    self.name = None
    self.managed_by_pharmacy_staff_name = None
    self.managed_by_pharmacy_staff_id = None
    self.type = None
    self.expiration_date = None
    self.stock_level = None

  @staticmethod
  def get_all():
    try:
      medications_data = Database.select(Query.GET_ALL_MEDICATIONS)
      medications = []
      if medications_data:
        for row in medications_data:
          medication = MedicationModel(row['medication_id'])
          medication.name = row['name']
          medication.managed_by_pharmacy_staff_id = row[
              'managed_by_pharmacy_staff_id']
          medication.managed_by_pharmacy_staff_name = row[
              'managed_by_pharmacy_staff_name']
          medication.type = row['type']
          medication.expiration_date = row['expiration_date']
          medication.stock_level = row['stock_level']
          medications.append(medication)
      return medications
    except DatabaseError as db_err:
      print(f"Failed to retrieve medications. Error: {db_err}")
      return None

  @staticmethod
  def get(medication_id):
    try:
      medication_data = Database.select(Query.GET_MEDICATION_BY_ID,
                                        (medication_id))
      if medication_data:
        row = medication_data[0]
        medication = MedicationModel(row['medication_id'])
        medication.name = row['name']
        medication.managed_by_pharmacy_staff_id = row[
            'managed_by_pharmacy_staff_id']
        medication.managed_by_pharmacy_staff_name = row[
            'managed_by_pharmacy_staff_name']
        medication.type = row['type']
        medication.expiration_date = row['expiration_date']
        medication.stock_level = row['stock_level']
        return medication
      return None
    except DatabaseError as db_err:
      print(
          f"Failed to retrieve medication with ID {medication_id}. Error: {db_err}"
      )
      return None

  @staticmethod
  def update_stock_level(medication_id, new_stock_level):
    try:
      Database.update(Query.UPDATE_MEDICATION_STOCK_LEVEL,
                      (new_stock_level, medication_id))
      return True
    except DatabaseError as db_err:
      print(
          f"Failed to update stock level for medication ID {medication_id}. Error: {db_err}"
      )
      return False

  @staticmethod
  def get_medications_near_expiration():
    try:
      results = Database.select(Query.GET_MEDICATIONS_NEAR_EXPIRATION)
      if results:
        medications = []
        for row in results:
          medication = MedicationModel()
          medication.name = row['name']
          medication.expiration_date = row['expiration_date']
          medications.append(medication)
        return medications
      return None
    except DatabaseError as db_err:
      print(f"Failed to retrieve medications near expiration. Error: {db_err}")
      return None


class AppointmentModel(ModelInterface):

  def __init__(self) -> None:
    super().__init__()
    self.doctor_name = None
    self.appointments = []
    self.appointment_id = None
    self.patient_name = None
    self.doctor_name = None
    self.department_name = None
    self.equipment_name = None
    self.appointment_date = None
    self.appointment_time = None

  @staticmethod
  def get_monthly_appointments_count():
    try:
      results = Database.select(Query.CALL_GET_MONTHLY_APPOINTMENTS_COUNT)
      return results
    except DatabaseError as db_err:
      print(f"Failed to retrieve monthly appointments count. Error: {db_err}")
      return None

  @staticmethod
  def get_doctor_schedule_for_day(doctor_id, schedule_date):
    try:
      # Call the stored procedure using the static method
      appointments_data = Database.select(Query.GET_DOCTOR_APPOINTMENT_FOR_DAY,
                                          (doctor_id, schedule_date))
      # Create an instance of AppointmentModel
      appointment_model = AppointmentModel()
      # Check if appointments_data is not empty
      if appointments_data:
        # Populate doctor_name and appointments
        appointment_model.doctor_name = appointments_data[0]['doctor_name']
        for row in appointments_data:
          appointment_model.appointments.append({
              'doctor_id':
              row['doctor_id'],
              'doctor_name':
              row['doctor_name'],
              'patient_id':
              row['patient_id'],
              'patient_name':
              row['patient_name'],
              'appointment_id':
              row['appointment_id'],
              'appointment_date':
              row['appointment_date'],
              'appointment_time':
              row['appointment_time']
          })
      return appointment_model
    except DatabaseError as db_err:
      print(f"Failed to retrieve schedule. Error: {db_err}")
      return None

  @staticmethod
  def get_appointment_details():
    try:
      results = Database.select(Query.GET_APPOINTMENT_DETAILS)
      if results is None:
        return None
      appointments = []
      for row in results:
        appointment = AppointmentModel()
        appointment.appointment_id = row['appointment_id']
        appointment.patient_name = row['patient_name']
        appointment.doctor_name = row['doctor_name']
        appointment.department_name = row['department_name']
        appointment.equipment_name = row['equipment_name']
        appointment.appointment_date = row['appointment_date']
        appointment.appointment_time = row['appointment_time']
        appointments.append(appointment)
      return appointments
    except DatabaseError as db_err:
      print(f"Failed to retrieve appointment details. Error: {db_err}")
      return None


class EquipmentModel(ModelInterface):

  @staticmethod
  def get_utilization_rates(start_date, end_date):
    try:
      results = Database.select(Query.CALL_GET_EQUIPMENT_UTILIZATION_RATES,
                                (start_date, end_date))
      return results
    except DatabaseError as db_err:
      print(f"Failed to retrieve equipment utilization rates. Error: {db_err}")
      return None


class InsurancePlanModel(ModelInterface):

  @staticmethod
  def get_patient_count_by_insurance_plan(insurance_plan_id):
    try:
      results = Database.select(Query.CALL_GET_PATIENT_COUNT_BY_INSURANCE_PLAN,
                                (insurance_plan_id, ))
      if results:
        return results[0]
      return None
    except DatabaseError as db_err:
      print(
          f"Failed to retrieve patient count for insurance plan ID {insurance_plan_id}. Error: {db_err}"
      )
      return None


class PharmacyStaffModel(ModelInterface):

  @staticmethod
  def get_total_medications_managed_by_each_pharmacy_staff():
    try:
      results = Database.select(
          Query.CALL_GET_TOTAL_MEDICATIONS_MANAGED_BY_EACH_PHARMACY_STAFF)
      return results
    except DatabaseError as db_err:
      print(
          f"Failed to retrieve total medications managed by each pharmacy staff. Error: {db_err}"
      )
      return None
