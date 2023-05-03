# Week 4 — Postgres and RDS

# H1 Week 4 Activities

This week was all about setting up our database and write data to it. I have a chance to practice use of CLI commands to set up our database, AWS RDS, without a need to use console. From what we look at the lecture CLI set up looked much simpler than using console to configure our RDS DB.

We also used Psycopg2 which is a driver / connector for our Postgres DB to help us send data.

*Psycopg2 is a mature driver for interacting with PostgreSQL from the Python scripting language. It is written in C and provides a means to perform the full range of SQL operations against PostgreSQL databases.*

We have commented out our Dynamo DB code for now to offload our app setup via docker.

Next, I tested our Postgres connection locally that all is working as expected. Andrew provided us with list of commands to work with Postgres in terminal explaining how to list tables, databases etc.

![Connected to Postgres](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/connected_to_postgres.PNG)

I was able to connect and use `\l` to list avaliable DBs

![List avaliable DBs](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/list_of_dbs.PNG)

Cruddur database was created as a holding storage for our application, users and activities as per week 4 requirements.

![Cruddur DB created](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/cruddur_db_created.PNG)

We have then automated our DB connection by writing up a connection bash script.
I must say Andrew is so good in setting up traps that he falls for them himself. He misspelled password in his instructions which caused error but this was quickly debuged.

![Auto DB connection using string](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/connected_using_string_witout_typing_password.PNG)

Thanks to AWS Project Bootcamp I was introduced to bash scripting in more detail and was able to create a couple of scripts myself. 

Shebang is (` #!` ), first time I have heard that phrase.

I have also learned more about **CHMOD** which I used in the past but first time on a personal project. **CHMOD** it means change mode of a file
When we have changed the permission files show up green.

![Different file name colours after changing permissions](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/permision_changed_for_bin_db_files.PNG)

After testing our bash scripts we proved that we can create and drop our DB using prepared scripts.	

![Bash scripts for creating and dropping DB](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/drop_and_create_db.PNG)

It was a good practice to load and play with bash files and see them to execute pre defined commands. 

We have also created a logic to differentiated between connecting to development and production. 

![Connect to either dev or prod](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/prod_vs_dev_connections_schema_load.PNG)

Using colours within scripts was also good practice to help with debugging and something new I have learned. 

![Colours in terminal using echo](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/colour_in_echo.PNG)

I then moved on to create more bash scripts such as a connection one and script to load our schema also Andrew showed us how to create session bash scripts to show us list of live connections to our DB

![Session file listing DB connections](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/created_sessions_file.PNG)


We have inserted records to our table in **DEV DB** and run our first query.

![Proof of records in dev DB](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/records_in_the_table.PNG)

We have modified our seed file. My modification by using different names than not the ones provided by Andrews let me into a trap which I was struggling to understand. 
When I have changed names to default ones provided in Adnrew instructions all worked as expected. 
Error I was getting was `ERROR:  null value in column "user_uuid"`. I believe this was due to hardcoded code for user names in crudder app.


![Modified seed.sql file](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/modified_seed_sql.PNG)

![Proof of connection to prod DB](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/connected_to_prod_db.PNG)


I have then tested prod connection and modified our db-connect file by addind bash IF condition to differentiate between dev and prod to other bash files.
Furthermore, as part of week 4 activities we have created db.py file and made updates to our home activities code.

After we have modified files and added inbound rules to our RDS based on our Gitpod workspace IP which we then made sure it was auto-updated each time we start new workspace. 
Then we were able to run our query to get a feed for our frontend and show it on the screen.

![code update to db-connect script](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/updated_to_db_connect.PNG)

![back end query output](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/first_query_and_seed_imported_post.PNG)

## Week 4 – AWS Lamda

I crated a first lambda function called cruddur-post-confirmation. 
I used code provided by Andrew and have tried to add Lambda Layer as per instructions which at the end was successful after realising there are different layers per AWS AZ.

What is Lambda Layers?

A Lambda layer is a . zip file archive that can contain additional code or other content. A layer can contain libraries, a custom runtime, data, or configuration files.

Andrew showed us how to use cloudwatch logs for debugging. For debugging purpose we have printed our SQL to show up in logs.

![cloudwatch log with error](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/cloudwatch_lambda_log.PNG)

![cloudwatch log with error](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/lambda_code_changed_error_for_postsqldb.PNG)

![SQL in cloudwatch logs](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/query%20in%20the%20cloudwatchlogs.PNG)


I have added a Lambda trigger to Cognito and to allow connection from our RDS we had to modify our IAM permissions and add a VPC rule for our lambda. 

Also, as we went along we have modified our user table and added an email and when user was created in AWS Cognito it went in to our AWS RDS.

![Adding subnet rules for our Lambda](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/new_lambda_permision_and_vpc.PNG)

![User table with email](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/email_in_users_table.PNG)

![User added to prod DB table](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/user_in_db.PNG)

## Create Activity!

This was a challenging task and following Andrew I did a lot of coding. At the end when everything was set I was getting an error indicating that I m not inserting values to tables correctly as it was showing me NotNullViolation error. 
Thanks to AWS Bootcamp Project community I was able to find a solution and debug.

![Error that stopped posting](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/error_while_trying_to_post.PNG)

When problem was solved I was able to create a cruddur and post it!

![Posting works](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/posting_activities_works.PNG)

![Backend logs with activities table](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%204/backend_logs_after_posting_activities.PNG)

Extract from a table showing records in PROD database.
