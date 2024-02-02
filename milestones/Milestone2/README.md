# Milestone 2: Database Conceptual Design  (10 points)

In this milestone, students will use the technical info provided in milestone1 to build
the conceptual design of the database (ERD) and to create a detailed description of all the entities in the database.

***IMPORTANT: sections VI and VII from this milestone must be done concurrently***

## Section VI: Entity Relationship Diagram (ERD) (5 points)

Create an Entity Relationship Diagram (ERD) that will represent the conceptual high level design of your relational 
database system. This ERD must be done using a software tool that supports drawing diagrams. For this section
of the milestone, you ***MUST*** use [draw.io](https://www.draw.io). ***Note: hand-drawing diagrams are not allowed***

***The diagram must contain at least 16 STRONG entities to get credit for this checkpoint. Otherwise, the ERD will be considered incomplete; No exceptions!***

Once the ERD is completed, save it as "erd.drawio" and upload it into the ***files folder*** found in this directory. In addition, 
your ERD must be exported (pdf, png, jpg....) and must be embedded into your technical document created from milestone 1.
Screenshots of your ERD are also allowed as long as the image is readable and high quality. ***If we can't 
read your ERD, no credit will be given for this checkpoint***

## Section VII: Entity Description (5 points)

This section **MUST** be completed concurrently with section VI because most of the weak entities will be unknown 
until the ERD is completed. When describing your entities state clearly their form (strong or weak), and include ***at least 
three attributes*** per entity. The attributes must be defined by their domain and form. Below, you can find several
examples of entities descriptions.

      1. User (Strong)
          * user_id: key, numeric 
          * name: composite, alphanumeric
          * dob: multivalue, timestamp
          
      2. Book (Strong)
          * ISBM: key, alphanumeric
          * title: composite, alphanumeric
          * author: composite, alphanumeric
      
      3. Role (Strong)
          * role_id: key, numeric
          * description: alphanumeric
      
      3. Account (Weak)
          * id: key, numeric 
          * user: key, numeric 
          * role: key, numeric
          


***Note: give meaningful names to your entities and your attributes. For instance 'rid' is not a good
attribute name for the id of the role***

# Submission Guidelines

The following are the submission guidelines for this milestone. 
 
   * In this directory: A pdf file (m2.pdf) uploaded into this directory with ***your work in milestone 1 and 2***. Files uploaded to this
     directory in a format other than PDF won't be considered for grading. 

   * In the "files" folder of this directory: a file erd.drawio that contains the original ERD created in this milestone

   * On Canvas (using the submission link for this assignment): A link (url) pointing to Milestone 2 folder in your repository

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
   
   * The ERD diagram must have all the database relationships representing all your functional and non-functional requirements 
     from milestone 1 and ***must*** have at least 16 strong entities to be considered for grading.

   * Section VI: 

     * If the ERD diagram was not created using DrawIO or the ERD's image submitted in the pdf document is blurred or
       not readable then (-5 points)

     * For every week entity that is designed as strong entity then (-0.5 points)

     * For each relationship that is not implemented properly then (-0.2 points)

     * For each entity that has two states at the same time (strong and weak) then (-0.2 points)

     * For each entity that does not follow the shape conventions stated in class to define their type then (-0.2 points)

   * Section VII: 

     * For each entity described that does not follow the directions specified in the section VII guidelines from this document
       then (-0.2 points)

     * For each entity described that has less than three attributes then (-0.2 points)

     * All the entities and their attributes must have meaningful names. For example, in this section you can't call  
       an associative entity "has". It needs to have a meaningful name as stated in many examples covered during lectures. 
       Failure to follow this policy will result in a deduction of (-0.3 points) per entity.

Good luck, everyone!
   
   
