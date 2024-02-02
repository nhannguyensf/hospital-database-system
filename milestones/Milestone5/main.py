"""
The code below is just representative of the implementation of a Bot. 
However, this code was not meant to be compiled as it. It is the responsability 
of all the students to modifify this code such that it can fit the 
requirements for this assignments.
"""

import discord
import os
from discord.ext import commands
from models import *

#TODO:  add your Discord Token as a value to your secrets on replit using the DISCORD_TOKEN key
TOKEN = os.environ["DISCORD_TOKEN"]

intents = discord.Intents.all()

bot = commands.Bot(command_prefix='!', intents=discord.Intents.all())


@bot.command(name="test", description="write your database business requirement for this command here")
async def _test(ctx, arg1):
    testModel = TestModel(ctx, arg1)
    response = testModel.response()
    await ctx.send(response)


# TODO: complete the following tasks:
#       (1) Replace the commands' names with your own commands
#       (2) Write the description of your business requirement in the description parameter
#       (3) Implement your commands' methods.

@bot.command(name="cmd_1", description="database business requirement #1 here")
async def _command1(ctx, *args):
    await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_2", description="database business requirement #2 here")
async def _command2(ctx, *args):
    await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_3", description="database business requirement #3 here")
async def _command3(ctx, *args):
    await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_4", description="database business requirement #4 here")
async def _command4(ctx, *args):
    await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_5", description="database business requirement #5 here")
async def _command5(ctx, *args):
    await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_6", description="database business requirement #6 here")
async def _command6(ctx, *args):
    await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_7", description="database business requirement #7 here")
async def _command7(ctx, *args):
    await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_8", description="database business requirement #8 here")
async def _command8(ctx, *args):
    await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_9", description="database business requirement #9 here")
async def _command9(ctx, *args):
    await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_10", description="database business requirement #10 here")
async def _command10(ctx, *args):
    await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_11", description="database business requirement #11 here")
async def _command11(ctx, *args):
    await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_12", description="database business requirement #12 here")
async def _command12(ctx, *args):
    await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_13", description="database business requirement #13 here")
async def _command13(ctx, *args):
    await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_14", description="database business requirement #14 here")
async def _command14(ctx, *args):
    await ctx.send("This method is not implemented yet")


@bot.command(name="cmd_15", description="database business requirement #15 here")
async def _command15(ctx, *args):
    await ctx.send("This method is not implemented yet")


bot.run(TOKEN)
