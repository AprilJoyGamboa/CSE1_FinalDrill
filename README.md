# Laboratory - Final Drill 


Final Hands-on Drill

Final Exam Drill. CSE1
Activity: Building a CRUD REST API with MySQL, Testing, and XML/JSON Output
In this hands-on activity, you will be creating a CRUD (Create, Read, Update, Delete) REST API for your chosen MySQL database (from
our recent activity). The API will allow users to interact with the database and will act as an Interface to any client that understands
JSON or XML. You will also set up tests to ensure the functionality of the API, and provide the option to format the API output as XML
or JSON.

Instructions:
1. Setup your database: It will be assumed that you’ve installed a MySQL server with your chosen database in your system, make
sure it contains enough (20 records and above) for testing.

2. Create a new GitHub repository for your project. Make sure to select the option to initialize the repository with a README fi le,
write down the installation procedures of your project here once you’re done. Clone the repository to your local development
environment.

3. Create a virtual environment for your project, and ignore it in your. gitignore file and go into the virtual environment (see video
series for context), do not include the environment when you upload your project in Github.

4. Install libraries needed for this project (just like in the tutorial video(s))

5. Code your Flask REST API Web Application.

Grading Breakdown:
1. Github commit and push (containing multiple commits having different timestamp): 4 points
Push your local Git repository to the remote repository on GitHub. search for git best practices, to have a basic idea how
to organize your commits.

2. CRUD(Create, Read, Update, Delete) operations (contains input validations, error handling): 8 points
Return appropriate HTTP responses based on the success or failure of the operations, search for the appropriate header
values when providing responses for API’s.

3. CRUD Tests: (4 points)
Write test cases to cover all the CRUD operations for the API endpoints. Ensure that the tests cover different scenarios
and edge cases.

4. Formatting options (5 points)
Modify the API endpoints to check for a URI parameter (e.g., format) that specifies the desired output format (XML or
JSON). If the parameter is not provided, JSON should be the default format. (see last video in the tutorial series for more
information)

5. Implement search functionality, allowing users to search for records based on specific criteria. (4 points)

6. Add security mechanisms to secure the API endpoints (search JWT or similar) (5 points)

7. Documentation (5 points). Update the README file in your GitHub repository to include project details, installation
instructions, usage examples, API usage (see documentation of popular APIs for more info.) and any additional
information that would help others understand and run your project.

8. Video explainer, demo the features in the video while explaining the technical aspects of its code (e.g why did you do it
that way), the explainer has no points grade, but is required for this drill, submission without a video explainer means
No Grade, features which are implemented in the code but without explanation in the video means No points. (You must
be visible in the video. Explain your work as technical as possible)
SUBMISSION REQUIREMENTS:
• Public Google drive folder link containing the project (source code, ERD for db, SQL dump etc.)
• Video explainer (MP4 format) link (you can source this anywhere as long as it’s publicly accessible)
• Github URL that points to your project repository
• Provide all of the above links to a Google form provided in our Google classroom post (other forms of submission is
prohibited).

## Usage
This is just a simple CRUD of customers table in payments and its method data model - or database

### POST /users

   ```http
   #http://127.0.0.1:5000/login
   users:{
     "admin": "password",
     "username": "password"
   }
  ```
