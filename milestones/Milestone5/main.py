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
             description="Get infomation of an employee using employee's id")
async def _getemployeebyID(ctx, arg1):
  employee = EmployeeModel.get(arg1)
  if employee is None:
    response = f"There is no information available for the employee with ID {arg1}."
  else:
    response = f"Here's the information of employee with ID {employee.employee_id}: \n\n -Name: {employee.employee_name} \n -Hospital: {employee.hospital} \n -Department: {employee.department} \n -Bio: {employee.bio} \n -Email: {employee.email}"
  await ctx.send(response)


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
async def _getpatientbyID(ctx, patient_id: int):
  patient = PatientModel.get(patient_id)
  if patient:
    embed = discord.Embed(
        title=f"Patient Information for ID {patient_id}",
        description=
        f"Here is the information for the patient with ID {patient_id}:",
        color=discord.Color.blue())
    embed.add_field(name="Name", value=patient.patient_name, inline=False)
    embed.add_field(name="Date of Birth",
                    value=patient.patient_DOB,
                    inline=False)
    embed.add_field(name="Contact", value=patient.contact_number, inline=False)
  else:
    embed = discord.Embed(
        title=f"No Information Found for Patient ID {patient_id}",
        description=
        f"No information is available for the patient with ID {patient_id}.",
        color=discord.Color.blue())
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
  medication = MedicationModel.get(medication_id)
  if medication:
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
        description=f"Medication with ID {medication_id} not found.",
        color=discord.Color.red())
  await ctx.send(embed=embed)


@bot.command(name="decreasestock",
             description="Decrease a medication's stock level")
async def _decreasestock(ctx, medication_id: int, amount: int):
  medication = MedicationModel.get(medication_id)
  if medication:
    new_stock_level = max(medication.stock_level - amount, 0)
    success = MedicationModel.update_stock_level(medication_id,
                                                 new_stock_level)
    if success:
      embed = discord.Embed(
          title="Stock Level Updated",
          description=
          f"The stock level for medication ID {medication_id} has been decreased by {amount}. New stock level: {new_stock_level}",
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
        description=f"Medication with ID {medication_id} not found.",
        color=discord.Color.red())
  await ctx.send(embed=embed)


@bot.command(name="cmd_7", description="database business requirement #7 here")
async def _command7(ctx, *args):
  await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_8", description="database business requirement #8 here")
async def _command8(ctx, *args):
  await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_9", description="database business requirement #9 here")
async def _command9(ctx, *args):
  await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_10",
             description="database business requirement #10 here")
async def _command10(ctx, *args):
  await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_11",
             description="database business requirement #11 here")
async def _command11(ctx, *args):
  await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_12",
             description="database business requirement #12 here")
async def _command12(ctx, *args):
  await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_13",
             description="database business requirement #13 here")
async def _command13(ctx, *args):
  await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_14",
             description="database business requirement #14 here")
async def _command14(ctx, *args):
  await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_15",
             description="database business requirement #15 here")
async def _command15(ctx, *args):
  await ctx.send("This method is not implemented yet")


bot.run(TOKEN)
