# Milestone 1: Project Description and Database Requirements  (10 points)

The goal of this milestone is to create a complete technical document that will define in detail the conceptual 
design and architecture of your database system. Note that this milestone is a professional document that is read 
by technical and non-technical people and teams (i,e CEO, CTO, Project Managers, Founders, Engineers, Testers....).

Milestone 1 contains several checkpoints that represent the technical documentation for your database system. 

Students will be provided with a random database topic assigned by the instructor. Once a database topic is assigned, it is highly recommended doing some research about the topic. Several things to consider during your research are finding out the missing features of similar databases systems and create or improve them in your database system. During your research, take notes of your findings because you'll summarize them in your product summary. (more about this later)

### Section I: Cover Page (0.25 points)

The cover page of your document must contain the title of your project (i.e. Library Management System ), your name, student id and GitHub username, and finally, a version history table similar to the one in the below:

|     Checkpoint #  |    Date Submitted   |
| ----------------- | ------------------- |
|    Checkpoint I   |      02/14/2023     |

### Section II: Table of Contents (0.25 points)

A technical document like this one is read by technical and non-technical people (i,e CEO, founders, 
engineers....). So, some of them would want to have access to specific sections of this milestone directly and 
skip some others. A table of contents with page numbers will help them to access quickly to all the content in 
this milestone. The table of contents must be updated after a checkpoint is finished to reflect the page number 
corresponding to all the content included in that checkpoint.
   

### Section III: Project Description (1 point)

In this section, you are going to create a complete description of the idea for your database system project. 
Note that this is a high level description since at this point, the scope of the database system that you are about to create 
is not clear yet. Use the following guidelines to create your product description in paragraph form.

    • Describe the motivations to create this database system and which problems you are trying to solve (high level only)
    • A high level non-technical description of your database system 
    • A description of the unique features (high level only) that you will implement in your database system based on 
      your research, including the ones that exists in other similar database systems which will be improved in your system.
    • Name at least two existing software tools or products that are actually in the market that would benefit from using your database system. Explain in
      detail the WHY.

### Section IV: Functional Database Requirements (4 points)

Functional requirements are the ones that focus on the services provided to cover the database user needs. For example, "A user shall be able to log into the system from multiple devices". Functional requirements are grouped by the entity that performed the action. 

Students must provide at least 60 functional database requirements, and they must be enumerated and grouped by the entity that performs the action. The following are some examples of database requirements extracted from a library database management system

    1. User 
        1.1. A user shall create only one account 
        1.2. A user shall be able to check out multiple books at a time
        1.3. A user shall have at least one role.

    2. Account 
        2.1. An account shall be created by only one user. 
    
    3. Role
        3.1 A role shall be linked to many users. 
    
    4. Book
        4.1 A book can be checked out by multiple users

Functional database requirements listed in this section must cover ALL the following relationships:

1. Many-to-Many
2. One-to-One
3. Many-to-One
4. One-to-Many
5. ISA
6. Aggregation 
7. Recursive

### Section V: Non-functional Database Requirements (4 points)

Non-functional database requirements focus on the constraints and properties of the database system. They are grouped 
by categories (for more details refer to your class notes and slides)

Students must provide at least 5 non-functional requirements per category for the categories of Performance, Security, Scalability, 
Capability, Environmental, Coding Standards, Media Storage and Privacy. Feel free to add more categories to this list. 

The following are some examples of non-functional database requirements: 

     1. Performance 
         1.1 The database system shall support concurrent transactions. 
         
     2. Storage 
         2.1 The database system shall assign 10 MB of memory per table.
         2.2 The database system should support persistent storage
         
     3. Security
         3.1 Only encrypted passwords shall be supported by the database system 
         3.2 All the values inserted into the database shall be consistent with the attribute's datatype and domain. 
         3.2 The database shall be automatically backed up everyday at 11:59 pm. 



# Submission Guidelines

The following are the submission guidelines for this milestone. 
 
   * In this directory: A pdf file (m1.pdf) uploaded into this directory with your work in milestone 1. Files uploaded to this
     directory in a format other than PDF won't be considered for grading. 

   * On Canvas (using the submission link for this assignment): A link (url) pointing to Milestone 1 folder in your repository

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

   * No work or if the assignment is not submitted by the specified deadlines for this assignment, then (-10 points)
   
   * Section I: -0.25 points is the section is not completed

   * Section II: -0.25 points if the table of contents does not provide any value to the assignment. For example, sections
     can't be referred by page number. 

   * Section III: 

     * -0.25 points if the project description doesn't clearly state the motivations of the students to create 
       this project based on their own research. 
  
     * -0.25 points if the project description doesn't clearly state a high level non-technical description of your database system 

     * -0.25 points if the project description doesn't clearly state a description of the unique features (high level only)
   
     * -0.25 points if the project description doesn't clearly state at least two existing software tools or
     products that are actually in the market that would benefit from using your database system

   * Section IV: 
   
     * A minimum of 60 functional requirements is mandatory for this section. Otherwise, the section will be 
       considered incomplete and the rules for incomplete work will apply
   
     * -2 points if the functional requirements are not grouped by entity. 

     * -0.1 point for each functional requirement that doesn't follow the rules stated during lectures when this 
       topic was covered.

   * Section V: 

     * A minimum of 5 non-functional requirements per category is mandatory for this section. Otherwise, the section will be 
       considered incomplete and the rules for incomplete work will apply

     * -2 points if the non-functional requirements are not grouped by category

     * -0.1 point for each non-functional requirement that doesn't follow the rules stated during lectures when this 
       topic was covered.

Good luck, everyone!
   
