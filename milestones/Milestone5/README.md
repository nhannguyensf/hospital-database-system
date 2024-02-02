# Milestone 5: Final Project  (10 points)

In this milestone, students will create a Discord bot that will serve as a bridge interface to serve knowledge between their database system they created in this class and the final user of your application. 
The main goal of this milestone is to transform the data (output from your business rules) into knowledge to meet the user's needs. 

***IMPORTANT NOTE: although I provide code in Python for this project, refrain from using it if you are not familiar with Python.
If that is the case, use your favorite programming language to create your bot. In my experience, students aiming to 
do this project in Python and who are not familiar with the language do not do well in this project because they will spend a lot
of time trying to fix and understand syntax errors from the language itself rather than focusing on the parts that matter
the most in this milestone such as implementing (and understanding) database business requirements, and learning about Database Access Object Modeling techniques.***

# Getting Started

Bots are really popular (and sometimes necessary) in modern apps because they can be used to automatize processes, 
automatically handle data from storage systems (e.g. databases), and provide specific services to the user of the app.
For instance, Nina's bot -- the one I created to manage my discord server --  saves me a 
lot of work, and it is capable to handle basic requests from students. 

In this milestone, students will be building their own Discord bot using their database design created in milestone 1. Your bot must connect 
to your database system to solve some business problems on the scope of your database system design. 

Note that students are free to choose their favorite programming language to create this project as long as the programming language of their choice provide the proper connectors and capabilities to connect the code to your remote MySQL database. In addition, there will be some code provided by the instructor in Python to help students to get started with this project. However, here is a list of useful resources (for students using a different programming language other than Python) that will help with the development of the bot for this milestone

* [How to create a Discord Bot with Java](https://medium.com/discord-bots/making-a-basic-discord-bot-with-java-834949008c2b)
* [How to create a Discord Bot with Javascript](https://www.freecodecamp.org/news/create-a-discord-bot-with-javascript-nodejs/)

## User Interface (Bot) Setup  

Let's get started with the setting up of your Discord server. In this section you will create a Discord server and will set up a Bot to be used in this server.

### Discord Account

If you do not have a Discord account yet, create a new one [here](https://discord.com). If you already have a Discord account,
then ignore this step

### Creating a Discord Server (Technically Know as Guild)

We'll use a Discord server as the user interface between out Bot and the user. 

1. Head to the discord [home](https://discord.com) page and sign in (if needed) using your Discord account
2. On the left-hand panel, select the + icon to add a new server 
3. It will prompt two options, select "Create Your Server", and provide the following name to your server 
"<your sfsu username>Server". For instance, my server would be named "jortizcoServer"
4. Create the following channels in your Discord Server:
   ``` 
      #business-requirements
      #commands
      #testers-feedback
    ```
5. In the ```#business-requirements``` channel, write a list of 15 business requirements. This is a hard rule in this milestone, 
   anything less than 15 business requirements won't be graded. Database business requirements need to be clear, hard to 
   solve and concise because they will be used to test the integrity of your database system. In class, we'll go over 
   several examples of database business requirements. Your business requirements must be approved by your instructor. 
   Otherwise, your work in this milestone won't be accepted for submission.

When writing your database business requirements keep in mind the following user needs for the SQL components these requirements **MUST** cover:

 * All the SQL implementation of your business requirements must be done using stored triggers, procedures or functions
 * All the queries implemented within the stored SQL components must be implemented to solve hard problems, and these queries
   must apply all the optimization techniques covered in class. 
 * SQL queries similar to ```SELECT * FROM X``` or ```SELECT * FROM X WHERE p = y``` won't be accepted in this milestone. 
   your queries must be really hard to implement to the point that they will test the integrity of your database. They 
   must contain JOINS, GROUP BY, UNION, HAVING, and other SQL optimizations such as inner queries. 
    
***IMPORTANT: All your database business requirements must take user input. Please see examples covered in class for more details.***

6. In the ```#commands``` channel write the list of commands that the bot needs in order to solve each one of your 15 business rules, and also add there some real examples about how to run those commands. (similar to what I did with my NinaBot in #bot-commands channel). Note that your bot commands must take user input, please refer to the examples covered in class for more details.

7. For now, leave the ```#testers-feedback``` channel empty. 

### Discord Application 

A Discord application allows the user to interact with the Discord API. As many other APIs, 
you'll need to provide authentication and permissions. Applications in Discord are a high level abstraction to provide
communication between the Discord API and your Bot. 

1. In your [Discord Developer Portal](https://discord.com/developers/applications), click on the "New Application" button
to create a new application. 
2. You'll be prompted to enter the name of the application, create the following name "CSC675M3" for your application, and
save the changes. 
3. Next, you'll be able to see all the information about your new application.  

### Discord Bot 

Once an application has been successfully created, it is time to create your Bot user. The job of the Bot user is to 
react to certain events and command triggered by the user.  

1. Head to the left panel of your application in your [Developer Portal](https://discord.com/developers/applications)
and select the tab "Bot", and click on the "Add Bot" button found on the right panel of the bot tab. 
2. After the bot is successfully created, edit the name of your bot. Set the new name to "CSC675<your sfsu username>Bot"
where your SFSU username is the name before the @ in your SFSU email. For instance, if I were to create a bot, I would 
name it "CSC675jortizcoBot" (without quotes) because my SFSU email is jortizco@sfsu.edu. 
3. Click on reveal the Token link that is located below the username field of your bot, this token will be used later to provide authentication when the bot needs 
to access to the Discord API of your application. We'll use this token later when coding the Bot.  
4. Save all the changes 


### Adding your Bot to your Server

Finally, we'll finish the set-up of our application by registering our Bot to our server. Note that the Bots use the 
[QAuth2](https://oauth.net/2/), and we need to set up the Bot to use that protocol. 

1. Head again to your application [Developer Portal](https://discord.com/developers/applications) and click in your application. 
2. Head to the left-hand panel of your application and select the QAuth2 tab. This tool will authorize the use of Discord APIs for your bot using your 
application's credentials 
3. On the right panel, set the authorization method to "In-app Authorization" and then in "scopes" check the "bot" checkbox. 
4. On the bot tab, set up all the "Intents" permissions on, then head to "Bot Permissions" and allow "administrator" permissions for your bot.
5. Copy and paste the client id that can be found in "Client Information". 
6. Use the following link https://discordapp.com/oauth2/authorize?&client_id=YOUR_CLIENT_ID_HERE&scope=bot and replace YOUR_CLIENT_ID_HERE in the url with the client id from (5)

### Hosting your Database Remotely

First, students must host their database model remotely (localhost is not allowed in this milestone). Students are 
free to choose the hosting server to host their databases. Some examples of remote host where you can host a relational database for free are [AWS](https://aws.amazon.com/free/database/?trk=c0fcea17-fb6a-4c27-ad98-192318a276ff&sc_channel=ps&sc_campaign=acquisition&sc_medium=ACQ-P%7CPS-GO%7CBrand%7CDesktop%7CSU%7CDatabase%7CSolution%7CUS%7CEN%7CText&s_kwcid=AL!4422!3!548665196301!e!!g!!amazon%20relational%20db&ef_id=CjwKCAjw3K2XBhAzEiwAmmgrAoE1SvlDFAECMaxijNoBwdjfg6U6GcmNkrqIVqPruWdH2TxNSS5N9xoCJ_oQAvD_BwE:G:s&s_kwcid=AL!4422!3!548665196301!e!!g!!amazon%20relational%20db), [Google Cloud](https://cloud.google.com), [Microsoft Azure](https://azure.microsoft.com/en-gb/free/). Note that in the remote database host of your choice, you must have permissions to run stored SQL triggers, procedures and functions. 

Once the cloud instance to host remotely your database is set up, create a database there and configure it properly to allow external connections. Once created, connect to your remote database from MySQLWorkbench and run from there your databasemodel.sql script to create the tables in your new remote database. In addition, and after creating your tables, run the inserts.sql script from MySQLWorkbench to populate your remote database with data.

Once your database has been created and populated with sample data in your remote host server. You'll need to write down somewhere (this will be used later) the following info provided by your database host server.

• The host url 

• The name of the database 
    
• Your db username 
    
• Your db password 

*** IMPORTANT: please refrain from spending money to host your database remotely. All the most popular cloud host servers (but Heroku) offer free trials accounts that are free as long as you don´t use any paid features or increase the resources needed. For this project, you won´t need any special feature or resource from the remote host. Note that the university, CS department and the course´s instructor are not responsible for extra charges applied to your account in your remote server for this project. It is the sole responsibility of the student to make sure that your remote database is not using paid features or extra resources.***

### Hosting your Bot in Replit 

For this milestone it is mandatory that students host their Bots in [Replit](htpps://replit.com). That way system 
incompatibilities during the grading process are minimized. Please refrain from hosting your database directly in Replit because it does not offer built-in support for MySQL. 

The next steps will guide you into creating your bot (manually or importing this repository) into [Replit](https://replit.com)

1. Create a new account in [Replit](https://replit.com) (if you don't have one already)
2. Login using your email and password from step (1)
3. Create a new repl app in your account. Note that [Replit](https://replit.com) supports many other programming languages. Choose the same programming language for your app that was chosen in Checkpoint VIII to implement the database, models and tests files.
4. Give a name to your repl. The name of your repl must be your SFSU username followed by "bot". For example, if my SFSU email is jortizco@sfsu.edu, then my username is jortizco, and my app would be named "jortizcobot".
5. If everything goes as expected, your screen will show your new programming environment for your app. Take your time to familiarize yourself with this environment. 
6. Copy and paste into your workspace in Replit all the files in this directory  

### Secret Environment Variables

Your repl app allows you to set up secret environment variables such as tokens, db usernames and passwords. We'll use this tool
to set all the environments variables related to our bot and the database

Head to the left-hand panel of your application, and click in the lock icon. 
Once there, set the following secret environment variables and their values 

```.env
DISCORD_TOKEN= dicord token of your bot
DB_HOST=       the host url where your remote database is hosted. (localhost won't work here)
DB_USER=       db username 
DB_PASSWORD=   db password
DB_NAME =      database name 
```

The Discord token can be copied and pasted from your [Developer Portal](https://discord.com/developers/applications) 
in the Bot tab from your application. 

Note that you don't need to modify the code related to the secret environment variables in 
"main.py" and "database.py". It is already ready to be used because it is reading
from any value set in those keys. For example, ```host = os.environ["DB_HOST"]``` will save the
database host in the ```host``` variable. 

Now, your bot is ready to be tested. Click on the "RUN" button of your application and if the app runs without errors, you should
see a message in the application console stating that your bot is online and connected to your database. If your app is throwing errors
or the bot is not online nor connected to your remote database, then please revise the process again to make sure no mistakes were made during 
bot setup process. Please don´t hesitate to reach out the instructor for help if needed.

## Implementation and Testing 

In this section students will implement all the backend needed to solve their business requirements. The backend component of this bot will be implemented with SQL and the student's favorite programming language and ***Database Access Object Modeling techniques*** which are needed to optimize the performance of your database system. Please refer to your class notes and slides for more details about this topic. 

***Note that any query created to solve your business requirements MUST be fully optimized and MUST implement SQL techniques to avoid injection attacks as defined in the security category of your non-functional requirements from milestone 1.***

For implementing this milestone, students will code using the files' database.py, models.py, and unit_tests.py. Note that if you are using a programming language other than Python, then you will have to change the extension of these files and the code to the one from the programming language of your choice. 

***IMPORTANT: all the backend implementation for this checkpoint MUST be done in Replit***

Once your implementation required for this checkpoint is completed in files database.py and dbmodels.py. Use the file unit_tests.py to implement unit tests that will test all your functions returning data from the database implemented in this checkpoint. The instructor and the grader will run the unit tests provided and will check if your code was implemented correctly. However, we'll put special focus on the following components:  SQL implementation of your business requirements, query optimization, SQL injection and object modeling techniques. 


### Bot Implementation

In this section, the bot interface must be connected to the back-end where all the object modeling and queries where implemented. Pay special attention to error handling and command validation. Your app should work as expected, including situations where the user enters unexpected input. Performing input validation in both, the bot interface and backend components of the app, is a must to get a good grade in this project. 

### Bot Testing

Once your bot implementation is completed, use the class general channel on Discord to share the link to join your Discord server where your bot is hosted with everyone. ***Note: do not share with students the link to your Replit app, only share with them the link to join your Discord server***. Once joined, students will be in charge of testing your bot using the commands listed in your #commands channel. Create a #tests-reports channel in your Discord server so students can report there the errors found during the testing process. Please fix all the errors found by students by the deadline of this checkpoint.

# Submission Guidelines

The following are the submission guidelines for this milestone.

   * On Canvas:

     * A link to join your discord server. ***This link must work and MUST NOT have an expiration date***
     
     * A link to join your replit workspace. ***This link must work and MUST NOT have an expiration date***

     * A link (url) pointing to Milestone 5 folder in your repository

***Submission guidelines are designed to ensure a standardized and equitable assessment for all participants. 
It is paramount that each submission aligns meticulously with these guidelines. Failure to do so may regrettably result in a considerable deduction of points.*** 

# Grading Rubrics 

The following are the grading rubrics the TA and the instructor of this course will use to grade the work 
submitted by students.

    
   * All the sections in this milestone must be completed. Incomplete work or assignments not following the submission 
     guidelines in detail will get a non-passing grade in this milestone. ***No exceptions***

   * Work flagged by our AI detection tools will receive a temporary grade of zero points until the issue is resolved. We
     will apply the university policies regarding academic dishonestly when we get compelling evidence that the work
     submitted has been created by AI tools such as ChatGPT. 
   
   * Once a grade is assigned to a milestone, it won't be changed under any circumstance unless the TA or the instructor 
     made a mistake during the grading process.  

   * -10 points if no work is submitted or the assignment is not submitted by the assignment's deadline stated on Canvas
   
   * If any of your links submitted on Canvas for this milestone is broken or expired then (-10 points). If we can't access 
     your work, then we can't grade it.

   * Discord Server:
 
       * If your Discord server doesn't have the description of your business requirements then (-3 points)
     
       * If your Discord server doesn't have the commands with (1) the command, (2) a description of what the command does, 
         and (3) an example given of how to run the command. Then, (-2 points)
     
       * We'll test your bot commands (using your examples provided) in the general channel of your server. For every command 
         that is not implemented properly or fails, then (-0.5 points). Note that we will perform additional tests
         such as entering invalid parameters to see if students implement data validation to avoid SQL injection attacks
     
   * Replit Workspace: 
   
       * If your code on replit doesn't work or output errors then (-7 points). If your code doesn't work, then we will be
         unable to put your bot online nor the bot will connect to your remote database
     
       * If your code works but there is no evidence in the code that you are connecting remotely to the database, 
         or the connection fails, then (-5 points). If your database is not working, then we can't test if your bot
         is receiving data from the database

       * If students wrote directly the queries to solve their business requirements without using object modeling as 
         learned in class then (-3 points). It is imperative to use object modeling in this assignment to encapsulate your
         code so the user (developer) using your APIs doesn't need to have any knowledge about databases.  
     
       * For each business requirement that hasn't been properly implemented (-0.5 points)

       * For each query that doesn't implement mechanisms to avoid injection attacks as seen in class during lectures (-0.2 points)

       

Good luck, everyone!


















 




