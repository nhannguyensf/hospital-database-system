"""
The code below is just representative of the implementation of a Bot. 
However, this code was not meant to be compiled as it. It is the responsability 
of all the students to modifify this code such that it can fit the 
requirements for this assignments.
"""

import os
import discord
from discord.ext import commands
from models import *
from database import Database

#TODO:  add your Discord Token as a value to your secrets on replit
#       using the DISCORD_TOKEN key
TOKEN = os.environ["DISCORD_TOKEN"]

intents = discord.Intents.all()

bot = commands.Bot(command_prefix='!', intents=discord.Intents.all())


@bot.command(
    name="test",
    description="write your database business requirement for this command here"
)
async def _test(ctx):
  testModel = TestModel(ctx)
  response = testModel.response()
  if response:
    print("Successfully connected to Discord")
  await ctx.send(response)
  d = Database()
  if d.connect():
    print("Successfully connected to Discord and database")
  await ctx.send("Bot is connected to database!")


# TODO: complete the following tasks:
#       (1) Replace the commands' names with your own commands
#       (2) Write the description of your business requirement in the description parameter
#       (3) Implement your commands' methods.


@bot.command(name="getallhospital",
             description="Get the data of all hospitals in the database")
async def _getallhospital(ctx, *args):
  hospitals = HospitalModel.get_all()
  if hospitals:
    embed = discord.Embed(
        title="All Hospitals",
        description="Here are all the hospitals in the database:",
        color=discord.Color.blue())
    for hospital in hospitals:
      embed.add_field(
          name=f"Hospital ID: {hospital.id}",
          value=f"Name: {hospital.name}\nLocation: {hospital.location}",
          inline=False)
  else:
    embed = discord.Embed(
        title="No Hospitals Found",
        description="There are no hospitals in the database.",
        color=discord.Color.blue())
  await ctx.send(embed=embed)


@bot.command(name="gethospitalbyID",
             description="Get information of a hospital using hospital's id")
async def _gethospitalbyID(ctx, arg1):
  hospital = HospitalModel.get(arg1)
  if hospital is None:
    response = f"There is no information available for the hospital with ID {arg1}."
    await ctx.send(response)
  else:
    embed = discord.Embed(
        title=f"Hospital Information (ID: {hospital.id})",
        description=
        f"**Name:** {hospital.name}\n**Location:** {hospital.location}",
        color=discord.Color.blue())
    await ctx.send(embed=embed)


@bot.command(name="getemployeebyID",
             description="Get information of an employee using employee's id")
async def _getemployeebyID(ctx, arg1: str = None):
  if arg1 is None:
    response = "Please provide a valid employee ID. Usage: `!getemployeebyID <employee_id>`"
    await ctx.send(response)
    return
  # Check if arg1 is a valid integer
  try:
    employee_id = int(arg1)
  except ValueError:
    response = "The provided employee ID is not a valid integer. Usage: `!getemployeebyID <employee_id>`"
    await ctx.send(response)
    return
  employee = EmployeeModel.get(employee_id)
  if employee is None:
    response = f"There is no information available for the employee with ID {employee_id}."
    await ctx.send(response)
  else:
    embed = discord.Embed(
        title=f"Employee Information (ID: {employee.employee_id})",
        color=discord.Color.blue())
    embed.add_field(name="Name", value=employee.employee_name, inline=False)
    embed.add_field(name="Hospital", value=employee.hospital, inline=False)
    embed.add_field(name="Department", value=employee.department, inline=False)
    embed.add_field(name="Bio", value=employee.bio, inline=False)
    embed.add_field(name="Email", value=employee.email, inline=False)
    await ctx.send(embed=embed)


@bot.command(name="addhospital",
             description="Add hospital's information with name and location")
async def _addhospital(ctx, *, input: str):
  try:
    name, location = input.split('|', 1)
    name = name.strip()
    location = location.strip()

    if not name or not location:
      raise ValueError("Name or location is missing")

    # Assuming HospitalModel.add(data) returns the newly added hospital object
    new_hospital = HospitalModel.add({'name': name, 'location': location})
    if new_hospital:
      embed = discord.Embed(
          title="New hospital added successfully!",
          description=
          f"**Hospital ID:** {new_hospital.id}\n**Name:** {name}\n**Location:** {location}",
          color=discord.Color.blue())
      await ctx.send(embed=embed)
    else:
      response = "Failed to add the hospital."
      await ctx.send(response)
  except ValueError as e:
    response = f"Error: {str(e)}.\nPlease use the format: !addhospital <name> | <location>"
    await ctx.send(response)


@bot.command(
    name="getdoctorappointmentforday",
    description="Retrieves a doctor's full schedule for a specific day")
async def _getdoctorappointmentforday(ctx, doctor_id: int, schedule_date: str):
  appointments = AppointmentModel.get_doctor_schedule_for_day(
      doctor_id, schedule_date)

  if appointments:
    if appointments.appointments:
      embed = discord.Embed(
          title=
          f"Doctor {appointments.doctor_name}'s Schedule for {schedule_date}",
          description=f"Doctor ID: {doctor_id}",
          color=discord.Color.blue())

      for appointment in appointments.appointments:
        embed.add_field(
            name=
            f"Appointment ID: {appointment['appointment_id']} - Time: {appointment['appointment_time']}",
            value=
            f"Patient: {appointment['patient_name']} (ID: {appointment['patient_id']})",
            inline=False)
      await ctx.send(embed=embed)
    else:
      await ctx.send(
          f"No appointments found for Doctor ID {doctor_id} on {schedule_date}."
      )
  else:
    await ctx.send(
        "Failed to retrieve the schedule. Please check the provided details.")


@bot.command(name="getallpatient",
             description="Get the data of all patients in database")
async def _getallpatient(ctx, *args):
  patients = PatientModel.get_all()
  if patients:
    embed = discord.Embed(
        title="All Patients",
        description="Here are all the patients in the database:",
        color=discord.Color.blue())
    for patient in patients:
      embed.add_field(
          name=f"Patient ID: {patient.patient_id}",
          value=
          f"Name: {patient.patient_name}\nDate of Birth: {patient.patient_DOB}\nContact: {patient.contact_number}",
          inline=False)
  else:
    embed = discord.Embed(title="No Patients Found",
                          description="There are no patients in the database.",
                          color=discord.Color.blue())
  await ctx.send(embed=embed)


@bot.command(name="getpatientbyID",
             description="Get information of a patient using patient's id")
async def _getpatientbyID(ctx, patient_id: str = None):
  if patient_id is None:
    response = "Please provide a valid patient ID. Usage: `!getpatientbyID <patient_id>`"
    await ctx.send(response)
    return

  # Check if patient_id is a valid integer
  try:
    patient_id_int = int(patient_id)
  except ValueError:
    response = "The provided patient ID is not a valid integer. Usage: `!getpatientbyID <patient_id>`"
    await ctx.send(response)
    return

  patient = PatientModel.get(patient_id_int)
  if patient:
    embed = discord.Embed(
        title=f"Patient Information for ID {patient_id_int}",
        description=
        f"Here is the information for the patient with ID {patient_id_int}:",
        color=discord.Color.blue())
    embed.add_field(name="Name", value=patient.patient_name, inline=False)
    embed.add_field(name="Date of Birth",
                    value=patient.patient_DOB,
                    inline=False)
    embed.add_field(name="Contact", value=patient.contact_number, inline=False)
  else:
    embed = discord.Embed(
        title=f"No Information Found for Patient ID {patient_id_int}",
        description=
        f"No information is available for the patient with ID {patient_id_int}.",
        color=discord.Color.blue())
  await ctx.send(embed=embed)


@bot.command(name="getreadmissioninfo",
             description="Get readmission information for a specific patient")
async def _getreadmissioninfo(ctx, patient_id: int):
  readmission_info = PatientModel.get_readmission_info(patient_id)
  if readmission_info:
    embed = discord.Embed(
        title=f"Readmission Information for Patient ID {patient_id}",
        description="Here are the readmission details:",
        color=discord.Color.blue())
    for entry in readmission_info:
      embed.add_field(
          name=f"First Appointment Date: {entry['first_appointment_date']}",
          value=
          f"Readmission Date: {entry['readmission_date']}\nDays Between: {entry['days_between']}",
          inline=False)
  else:
    embed = discord.Embed(
        title=f"No Readmission Information Found for Patient ID {patient_id}",
        description=
        f"No readmission details are available for the patient with ID {patient_id}.",
        color=discord.Color.blue())
  await ctx.send(embed=embed)


@bot.command(
    name="getpatientdetails",
    description=
    "Get patient information, medical records, and insurance information by patient ID"
)
async def _getpatientdetails(ctx, patient_id: str = None):
  if patient_id is None:
    response = "Please provide a valid patient ID. Usage: `!getpatientbyID <patient_id>`"
    await ctx.send(response)
    return
  # Check if patient_id is a valid integer
  try:
    patient_id_int = int(patient_id)
  except ValueError:
    response = "The provided patient ID is not a valid integer. Usage: `!getpatientbyID <patient_id>`"
    await ctx.send(response)
    return
  details = PatientModel.get_patient_details(patient_id_int)
  if details and len(details) > 0:
    # Extract common patient information
    patient_info = details[0]
    embed = discord.Embed(
        title=f"Patient Information for ID {patient_id_int}",
        description=
        "Patient information, medical records, and insurance information:",
        color=discord.Color.blue())

    embed.add_field(name="Patient ID",
                    value=patient_info['patient_id'],
                    inline=False)
    embed.add_field(name="Name",
                    value=patient_info['patient_name'],
                    inline=False)
    embed.add_field(name="Date of Birth",
                    value=patient_info['patient_DOB'],
                    inline=False)
    embed.add_field(name="Contact",
                    value=patient_info['contact_number'],
                    inline=False)

    # Iterate through the details to find medical records and insurance information
    for patient_info in details:
      # Add a dashed line before the next iteration
      embed.add_field(name="\u200b",
                      value="----------------------------",
                      inline=False)
      # Medical records
      if patient_info['medicalRecord_id']:
        embed.add_field(
            name="Medical Record",
            value=(f"Medical Record ID: {patient_info['medicalRecord_id']}\n"
                   f"Doctor ID: {patient_info['doctor_id']}\n"
                   f"Record Date: {patient_info['record_date']}\n"
                   f"Notes: {patient_info['notes']}"),
            inline=False)
      # Insurance information
      if patient_info['insurance_record_id']:
        embed.add_field(
            name="Insurance Information",
            value=
            (f"Insurance Record ID: {patient_info['insurance_record_id']}\n"
             f"Plan Name: {patient_info['plan_name']}\n"
             f"Provider: {patient_info['provider']}\n"
             f"Expiration Date: {patient_info['insurance_expiration_date']}\n"
             f"Policy: {patient_info['policy']}"),
            inline=False)
    await ctx.send(embed=embed)
  else:
    embed = discord.Embed(
        title=f"No Information Found for Patient ID {patient_id_int}",
        description=
        f"No details are available for the patient with ID {patient_id_int}.",
        color=discord.Color.red())
    await ctx.send(embed=embed)


@bot.command(name="getallmedication",
             description="Get the data of all medications in the database")
async def _getallmedication(ctx):
  medications = MedicationModel.get_all()
  if medications:
    embed = discord.Embed(title="Medications List", color=discord.Color.blue())
    for med in medications:
      embed.add_field(
          name=f"Medication ID: {med.medication_id}",
          value=
          (f"Name: {med.name}\n"
           f"Type: {med.type}\n"
           f"Managed By: {med.managed_by_pharmacy_staff_name} (ID: {med.managed_by_pharmacy_staff_id})\n"
           f"Expiration Date: {med.expiration_date}\n"
           f"Stock Level: {med.stock_level}"),
          inline=False)
  else:
    embed = discord.Embed(
        title="Medications List",
        description="No medications found or failed to retrieve medications.",
        color=discord.Color.blue())

  await ctx.send(embed=embed)


@bot.command(
    name="getmedicationbyID",
    description="Get information of a medication using medication's id")
async def _getmedicationbyID(ctx, medication_id: int):
  medication = MedicationModel.get(medication_id)
  if medication:
    embed = discord.Embed(
        title=f"Medication Information for ID {medication_id}",
        description=
        f"Here is the information for the medication with ID {medication_id}:",
        color=discord.Color.blue())
    embed.add_field(name="ID", value=medication.medication_id, inline=False)
    embed.add_field(name="Name", value=medication.name, inline=False)
    embed.add_field(name="Type", value=medication.type, inline=False)
    embed.add_field(
        name="Managed By",
        value=
        f"{medication.managed_by_pharmacy_staff_name} (ID: {medication.managed_by_pharmacy_staff_id})",
        inline=False)
    embed.add_field(name="Expiration Date",
                    value=medication.expiration_date,
                    inline=False)
    embed.add_field(name="Stock Level",
                    value=medication.stock_level,
                    inline=False)
  else:
    embed = discord.Embed(
        title=f"No Information Found for Medication ID {medication_id}",
        description=
        f"No information is available for the medication with ID {medication_id}.",
        color=discord.Color.blue())
  await ctx.send(embed=embed)


@bot.command(name="increasestock",
             description="Increase a medication's stock level")
async def _increasestock(ctx, medication_id: int, amount: int):
  if amount <= 0:
    embed = discord.Embed(title="Error",
                          description="The amount must be a positive integer.",
                          color=discord.Color.red())
    await ctx.send(embed=embed)
    return

  medication = MedicationModel.get(medication_id)
  if medication and isinstance(medication.stock_level, int):
    new_stock_level = medication.stock_level + amount
    success = MedicationModel.update_stock_level(medication_id,
                                                 new_stock_level)
    if success:
      embed = discord.Embed(
          title="Stock Level Updated",
          description=
          f"The stock level for medication ID {medication_id} has been increased by {amount}. New stock level: {new_stock_level}",
          color=discord.Color.green())
    else:
      embed = discord.Embed(
          title="Error",
          description=
          f"Failed to update the stock level for medication ID {medication_id}.",
          color=discord.Color.red())
  else:
    embed = discord.Embed(
        title="Error",
        description=
        f"Medication with ID {medication_id} not found or invalid stock level.",
        color=discord.Color.red())
  await ctx.send(embed=embed)


@bot.command(name="decreasestock",
             description="Decrease a medication's stock level")
async def _decreasestock(ctx, medication_id: int, amount: int):
  if amount <= 0:
    embed = discord.Embed(title="Error",
                          description="The amount must be a positive integer.",
                          color=discord.Color.red())
    await ctx.send(embed=embed)
    return

  medication = MedicationModel.get(medication_id)
  if medication and isinstance(medication.stock_level, int):
    new_stock_level = max(medication.stock_level - amount, 0)
    success = MedicationModel.update_stock_level(medication_id,
                                                 new_stock_level)
    if success:
      embed = discord.Embed(
          title="Stock Level Updated",
          description=
          f"The stock level for medication ID {medication_id} has been decreased by {amount}. New stock level: {new_stock_level}",
          color=discord.Color.green())
      await ctx.send(embed=embed)

      if new_stock_level < 50:
        alert_embed = discord.Embed(
            title="Alert",
            description=
            f"Warning: The stock level for medication ID {medication_id} is below 50. Current stock level: {new_stock_level}",
            color=discord.Color.orange())
        await ctx.send(embed=alert_embed)
    else:
      embed = discord.Embed(
          title="Error",
          description=
          f"Failed to update the stock level for medication ID {medication_id}.",
          color=discord.Color.red())
      await ctx.send(embed=embed)
  else:
    embed = discord.Embed(
        title="Error",
        description=
        f"Medication with ID {medication_id} not found or invalid stock level.",
        color=discord.Color.red())
    await ctx.send(embed=embed)


@bot.command(name="getalldoctor",
             description="Get the data of all doctors in the database")
async def _getalldoctor(ctx):
  doctors = DoctorModel.get_all()
  if doctors:
    embed = discord.Embed(
        title="All Doctors",
        description="Here are all the doctors in the database:",
        color=discord.Color.blue())
    for doctor in doctors:
      embed.add_field(
          name=f"Doctor ID: {doctor.doctor_id}",
          value=
          f"Specialization: {doctor.specialization}\nLicense Number: {doctor.license_number}",
          inline=False)
  else:
    embed = discord.Embed(title="No Doctors Found",
                          description="There are no doctors in the database.",
                          color=discord.Color.blue())
  await ctx.send(embed=embed)


@bot.command(name="deletedoctor",
             description="Delete a doctor using doctor's id")
async def _deletedoctor(ctx, doctor_id: int):
  doctor = DoctorModel.get(doctor_id)
  if doctor:
    success = doctor.delete()
    if success:
      response = f"Doctor with ID {doctor_id} has been successfully deleted."
    else:
      response = f"Failed to delete doctor with ID {doctor_id}."
  else:
    response = f"No doctor found with ID {doctor_id}."
  await ctx.send(response)


@bot.command(
    name="getemployeecountbydepartment",
    description=
    "Get the number of employees in a specific department by department ID")
async def _getemployeecountbydepartment(ctx, department_id: str = None):
  if department_id is None:
    response = "Please provide a valid department ID. Usage: `!getemployeecountbydepartment <department_id>`"
    await ctx.send(response)
    return

  # Check if department_id is a valid integer
  try:
    department_id_int = int(department_id)
  except ValueError:
    response = "The provided department ID is not a valid integer. Usage: `!getemployeecountbydepartment <department_id>`"
    await ctx.send(response)
    return

  employee_count = EmployeeModel.get_employee_count_by_department(
      department_id_int)

  if employee_count is not None:
    embed = discord.Embed(
        title=f"Employee Count for Department ID {department_id_int}",
        description=
        f"The number of employees in department ID {department_id_int} is {employee_count}.",
        color=discord.Color.blue())
  else:
    embed = discord.Embed(
        title=f"No Information Found for Department ID {department_id_int}",
        description=
        f"No employee count information is available for the department with ID {department_id_int}.",
        color=discord.Color.red())
  await ctx.send(embed=embed)


@bot.command(
    name="getequiputilization",
    description=
    "Get the utilization rates of medical equipment between specified dates")
async def _getequiputilization(ctx, start_date: str, end_date: str):
  try:
    utilization_rates = EquipmentModel.get_utilization_rates(
        start_date, end_date)
    if utilization_rates:
      embed = discord.Embed(
          title="Equipment Utilization Rates",
          description=
          f"Utilization rates of medical equipment from {start_date} to {end_date}, sorted by usage time:",
          color=discord.Color.blue())
      for rate in utilization_rates:
        embed.add_field(
            name=f"Equipment ID: {rate['equipment_id']}",
            value=
            (f"Name: {rate['equipment_name']}\n"
             f"Total Appointments: {rate['total_appointments']}\n"
             f"Utilization Rate: {rate['utilization_rate']:.2f} appointments per day"
             ),
            inline=False)
      await ctx.send(embed=embed)
    else:
      await ctx.send("No utilization data found for the specified date range.")
  except ValueError:
    await ctx.send("Invalid date format. Please use YYYY-MM-DD format.")


@bot.command(
    name="getdeptappointments",
    description=
    "Get the departments with the highest number of scheduled appointments")
async def _getdeptappointments(ctx):
  departments = DepartmentModel.get_departments_by_appointment_count()
  if departments:
    embed = discord.Embed(
        title="Departments by Appointment Count",
        description=
        "Departments with the highest number of scheduled appointments:",
        color=discord.Color.blue())
    for dept in departments:
      embed.add_field(
          name=f"Department ID: {dept['department_id']}",
          value=(f"Name: {dept['department_name']}\n"
                 f"Total Appointments: {dept['total_appointments']}"),
          inline=False)
    await ctx.send(embed=embed)
  else:
    await ctx.send("Failed to retrieve departments by appointment count.")


@bot.command(
    name="getpatientcountbyinsurance",
    description=
    "Get the number of patients subscribed to a specific insurance plan")
async def _getpatientcountbyinsurance(ctx, insurance_plan_id: str):
  try:
    # Convert the insurance_plan_id to an integer
    insurance_plan_id_int = int(insurance_plan_id)

    # Check if the insurance_plan_id_int is positive
    if insurance_plan_id_int <= 0:
      await ctx.send(
          "Insurance plan ID must be a positive integer. Please provide a valid ID."
      )
      return

    # Get the patient count and plan name
    result = InsurancePlanModel.get_patient_count_by_insurance_plan(
        insurance_plan_id_int)

    if result is not None:
      embed = discord.Embed(
          title="Patient Count by Insurance Plan",
          description=
          f"The number of patients subscribed to the insurance plan '{result['plan_name']}' (ID: {insurance_plan_id_int}) is {result['patient_count']}.",
          color=discord.Color.blue())
      await ctx.send(embed=embed)
    else:
      await ctx.send(
          "Failed to retrieve the patient count for the specified insurance plan."
      )
  except ValueError:
    await ctx.send(
        "Invalid insurance plan ID format. Please provide a valid integer.")


@bot.command(
    name="getlongtenuredepartments",
    description=
    "Get departments with doctors and nurses who have been employed for more than 5 years"
)
async def _getlongtenuredepartments(ctx):
  departments = DepartmentModel.get_departments_with_long_tenured_employees()

  if departments:
    embed = discord.Embed(
        title="Departments with Long-Tenured Employees",
        description=
        "Departments with doctors and nurses who have been employed for more than 5 years:",
        color=discord.Color.blue())
    for dept in departments:
      embed.add_field(name=f"Department ID: {dept['department_id']}",
                      value=f"Name: {dept['department_name']}",
                      inline=False)
    await ctx.send(embed=embed)
  else:
    await ctx.send(
        "No departments found with long-tenured employees or an error occurred."
    )


@bot.command(
    name="gettotalmedicationsbystaff",
    description=
    "Get the total number of medications managed by each pharmacy staff member"
)
async def _gettotalmedicationsbystaff(ctx):
  medications = PharmacyStaffModel.get_total_medications_managed_by_each_pharmacy_staff(
  )

  if medications:
    embed = discord.Embed(
        title="Total Medications Managed by Each Pharmacy Staff",
        description=
        "Here are the total number of medications managed by each pharmacy staff member:",
        color=discord.Color.blue())
    for staff in medications:
      embed.add_field(
          name=f"Pharmacy Staff ID: {staff['pharmacy_staff_id']}",
          value=
          f"Name: {staff['pharmacy_staff_name']}\nTotal Medications Managed: {staff['total_medications_managed']}",
          inline=False)
    await ctx.send(embed=embed)
  else:
    await ctx.send(
        "No medications found for any pharmacy staff or an error occurred.")


@bot.command(name="getmonthlyappointments",
             description="Get the count of appointments for each month")
async def _getmonthlyappointments(ctx):
  monthly_appointments = AppointmentModel.get_monthly_appointments_count()
  if monthly_appointments:
    embed = discord.Embed(
        title="Monthly Appointments Count",
        description="The count of appointments for each month:",
        color=discord.Color.blue())
    for record in monthly_appointments:
      embed.add_field(name=f"Month: {record['month']}",
                      value=f"Appointments: {record['appointment_count']}",
                      inline=False)
    await ctx.send(embed=embed)
  else:
    await ctx.send("Failed to retrieve monthly appointments count.")


@bot.command(
    name="getappointmentdetails",
    description=
    "Get detailed information of all appointments including patient, doctor, department, and equipment used"
)
async def _getappointmentdetails(ctx):
  appointments = AppointmentModel.get_appointment_details()

  if appointments:
    embeds = []
    embed = discord.Embed(
        title="Appointment Details",
        description="Detailed information of all appointments:",
        color=discord.Color.blue())

    for i, appointment in enumerate(appointments):
      embed.add_field(name=f"Appointment ID: {appointment.appointment_id}",
                      value=(f"Patient: {appointment.patient_name}\n"
                             f"Doctor: {appointment.doctor_name}\n"
                             f"Department: {appointment.department_name}\n"
                             f"Equipment: {appointment.equipment_name}\n"
                             f"Date: {appointment.appointment_date}\n"
                             f"Time: {appointment.appointment_time}"),
                      inline=False)
      # If 25 fields are added or it's the last appointment, save the current embed and create a new one
      if (i + 1) % 25 == 0 or (i + 1) == len(appointments):
        embeds.append(embed)
        embed = discord.Embed(
            title="Appointment Details (continued)",
            description="Detailed information of all appointments:",
            color=discord.Color.blue())

    for embed in embeds:
      await ctx.send(embed=embed)
  else:
    embed = discord.Embed(
        title="No Appointment Details Found",
        description=
        "Failed to retrieve appointment details or no appointments found.",
        color=discord.Color.red())
    await ctx.send(embed=embed)


@bot.command(
    name="getmedicationsnearexpiration",
    description=
    "Retrieve medications that are near their expiration date (within 30 days)"
)
async def _getmedicationsnearexpiration(ctx):
  medications = MedicationModel.get_medications_near_expiration()
  if medications:
    embed = discord.Embed(
        title="Medications Near Expiration",
        description=
        "Here are the medications that are near their expiration date (within 30 days):",
        color=discord.Color.blue())
    for med in medications:
      embed.add_field(name=f"Medication: {med.name}",
                      value=f"Expiration Date: {med.expiration_date}",
                      inline=False)
  else:
    embed = discord.Embed(
        title="No Medications Found",
        description="There are no medications near their expiration date.",
        color=discord.Color.blue())
  await ctx.send(embed=embed)


bot.run(TOKEN)
