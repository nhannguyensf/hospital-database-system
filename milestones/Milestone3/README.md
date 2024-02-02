# Milestone 3: Database Architecture and Modeling  (10 points)

In this milestone, students will build the database architecture and create a database model of their tables based on their ERD and entity description 
from milestone 2. 

Copy and paste your pdf file created in milestone 2 into this directory, and append there your work done in this milestone

## Section VIII: Entity Establishment Relationship Diagram (EER) (7 points)

***Note: This section must be done using MySQLWorkBench***

Create an Entity Establishment Relationship model (EER) of your database system based on the final version of your ERD and entity descriptions. 
Your EER must show clearly the following components:
 
   * PK, FK and Unique keys (if any)
  
   * All the table attributes, and their data types
  
   * NOT NULL in attributes (if any)
  
   * Identifying relationships and non-identifying relationships. Both of them represented by solid and dashed lines in 
  the database model. 
  
   * All the relationships between entities and their cardinalities including those with zeros 
   
Once the EER is completed do the following: 

   * Save your database model as err.mwb and upload this file to the "files" folder located in this directory 
   
   * Export your EER to any of the following formats (pdf, png, jpg....) and embed it in section VIII of the pdf file. 
     Screenshots of your EER are also allowed as long as the image is readable and high quality.

***If we can't read your EER, no credit will be given for this checkpoint***


## Section IX: Constraints Description (3 points)

In your document, create a description table (similar format to the one below) including all the tables that implement ON DELETE AND ON UPDATE and all their possible constraints (CASCADE, SET NULL......). This description should include a detailed comment about your motivations to select those tables as the ones that implement those constraints. 

|     Table     |       FK        |       ON DELETE        |        ON UPDATE        |                  Comment                        | 
| ------------- | --------------- | ---------------------- | ----------------------- | ----------------------------------------------- |
|    Account    |      user       |       ON CASCADE       |        ON CASCADE       | The account referencing the deleted user must be deleted because the account had a one-to-one relationship with this user
|    User       |      role       |       SET NULL         |        ON CASCADE       | If a role is deleted, the user that was holding that role can't be deleted because this user may hold more than one role


***Note that section IX is the last section for the technical documentation (pdf file) of your database***

# Submission Guidelines

The following are the submission guidelines for this milestone. 
 
   * In this directory: A pdf file (m3.pdf) uploaded into this directory with ***your work in milestone 1, 2 and 3***. Files uploaded to this
     directory in a format other than PDF won't be considered for grading. 

   * In the "files" folder of this directory: a file eer.mwb that contains the original EER model created in this milestone with MySQLWorkbench

   * On Canvas (using the submission link for this assignment): A link (url) pointing to Milestone 3 folder in your repository

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
   
   * The EER diagram must have all the database relationships covered in your ERD from milestone 2 and ***must*** have at least 16 strong entities to 
     be considered for grading.

   * Section VIII: 

     * If the EER's image added in section VIII in the pdf document is blurred or not readable then (-5 points)

     * For each relationship that is not implemented properly then (-0.2 points)

     * For each table that has two states at the same time (strong and weak) then (-0.2 points)

     * For each constraint that is not properly implemented  (-0.2 points)

   * Section IX: 

     * For each missing FK in this table (-0.5 points)

     * For each FK key in your database which constraints are not properly described in this table (-0.2 points) 
     
     

Good luck, everyone!
   
 














