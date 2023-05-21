# Week 5 — DynamoDB and Serverless Caching

This week was all about data and data modelling.

Aim of the lecture was to:
* Have a lecture about data modeling (Single Table Design) for NoSQL
* Launch DynamoDB local
* Seed our DynamoDB tables with data
* Write AWS SDK code for DynamoDB to query and scan put-item, for predefined endpoints
* Create a production DynamoDB table
* Update our backend app to use the production DynamoDB



At the start I had a good walkthrough from Ashish about best security practices for Dynamo DB in AWS.

Furthermore, I have learned about what a DAX as it was first time I have heard that.

**What is DAX cluster in AWS?**

*Amazon DynamoDB Accelerator (DAX) is a fully managed, highly available, in-memory cache for Amazon DynamoDB that delivers up to a 10 times performance improvement—from milliseconds to microseconds—even at millions of requests per second.*

**DAX operates within the VPC.**

We had a good introduction from Kirk. Which he is serverless caching developer at Memento. He covered it well and make it as an interesting subject that I didn't know a lot about.

This lecture was all about modelling and setting up DynamoDB. I have never worked with NO SQL database for real world scenario. 

All I knew about DynamoDB was that it was NoSQL DB and uses Key and Value store storing data model. Key corresponds to value and this way you extract data from DB.

Andrew showed us a diagram which explained in a visual way how our app which is direct messaging app is working and what data would we like to store in our DynamoDB. 

Pre planning as always is a good exercise to do before we start coding and designing things.
Questions to ask for DynamoDB designing and preplanning: 
* What data I need? 
* When do I need it? 
* How quickly do I need it? 
* This would help us to design our DB.

How do we do join in DynamoDB? There is no joints between tables as such like in SQL DB. For our app we would only use one table design. Access patterns are used instead oj relational databases diagrams as a pattern for retrieving data.

I have learned that DynamoDB has something called PartiQL where you can run queries on DynamoDB. At this point I was not sure how do we retrieve data from DynamoDB if we're not using queries.

DynamoDB has partition keys which act like primary keys in SQL DB. these keys can eb simple or composite. Also, DynamoDB has its own hash function.

Andrew supervised by Kirk helped us to understand how data is modelled.
Two keys are used in NoSQL DynamodDB; partition and sort key. It is interesting to see single table design for application.

I have learned what is GSI and LSI in DynamoDB. For a newbie it is a valuable lesson.

![GSI and LSI](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/ab_diagram_explains_gsi_lsi.PNG)

I didn't know that you can write the whole JSON file into one field to our NoSQL DB as a record.

To get my DynamoDB work I had to add boto3 to our installation. Boto is a python SDK for AWS.

We have reorganized our folder and file structure as we are going to create more bash scripts for DynamoDB this time. I have learned about using **args in python, definitely something I need to learn more about in the future.

![Proof of reorganised folders](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/folder_reorganisation.PNG)

I have populated schema-load bash script following Andrew instruction. To test our code we have run the bash command for schema. This created our table in DynamoDB.

First I have encountered an error while trying to set up DynamoDB.

We then went to list our tables using bash file to check what we have. Also is good to know that using `\` we can write inline code in new line.

![List of tables](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/list_of_tables_using_bash.PNG)

We have run our drop table script to test if it does delete tables. And it worked!

![Dropped table](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/deleting_table_cruddur-messages.PNG)


Now let's talk about a big fat file called seed where we went through each code section that Andrew have prepared and made sure that we know what the seed file does for us. We have split our conversation into an array of string lines. 

Each line represents what a person 1 or 2 is saying in the conversation, we used predefined ChatGPT as our test data. 
Next, in our code we went through each line to distinguish between person 1 and 2.

I have learned about a good practice in bash scripts to use else to catch errors if it is not used for something else in our logic to make action.

Also, that good lesson learned from Andrew was that if input is simple such as variables separated into data instead of a dictionary type data then simpler output and easier to test our application. Good to remember that for the future projects.

I have learned how to find and define a path of files we want to use if they're not in the same directory. It is through finding current and parent paths and then appending sys path to reference correct value.
My development slowed down as I had a bug in my seed sql and didn't close an insert values statement with a semicolon but a colon instead. this took me 30 min to realise. I'm even more impressed now how quickly Andrew debugs his errors.

I think I might fall for one of Andrews traps as I couldn't get results for users if I haven't commented out our create message function while following along with Andrew. At the end I got the confirmation that we have my user and other user replaced instead of user names.
Definitely I would need to go through all the code again to properly understand everything into small details. It will be good to learn bash scripting and use it more often to practice. I have managed to create a conversation within our database following instructions in the video.


![Proof of created conversations](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/creating_conversation.PNG)

Andrew helped us to create a scan for our local env to list data that we have in our database. This we achieved:
* Data has been inserted
* We seeded our data

![Results of scan bash script](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/result_of_scan.PNG)

We then moved forward and created a script to get us a list of conversation. Andrew helped us to get an output in a nice way, more human readable.

![Get conversation screenshot](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/get_conversation_1.PNG)

![Get conversation screenshot number 2](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/get_conversation_2.PNG)

Not nice from AWS that it tells you to use uppercase but then in fact you need to use lower case. As a sanity check we have narrow down our return results to come back with one message.

![Proof of return one message in conversation](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/sanity_check_returns_one_message.PNG)

As you can see by dates this is genuine me trying running a script :fire: I am so happy that it did run.

I have successfully implemented access patterns for DynamoDB. One obstacle was to implement a new function called `query_value`

![Error in db files](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/fixed_by_modifying_dbpy.PNG)

We had to modify our db.py to take more parameters to print query function.

![Capacity of returned records](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/capacity_and_return_record.PNG)

# Implement to front end and back end application.

For a start we created a library for DanamoDB. 

Good lesson about state and stateless classes and that the second ones simplify testing as you only need to worry about I/O. Another thing to remember is that our Cognito user id is called sub and also it is our uuid in our DBs.

I created a script to list users from Cognito. This will help us access user id and display messages accordingly.

![List of cognito users](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/list_users_in_cognito.PNG)

We have run into error while trying to run our setup script. 

![Error running a DB set up](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/err_running_setup.PNG)

At the end error was due to unknown issue which we will address later along the line. Instead, we have run our ‘update_cognito_user_ids`.

Then we went and deleted our cookies set up from a bunch of JS files as we will no longer use it.

I had to update uuid for my own user which meant to modify a code a bit as I don't have Andrews in my DB set correctly.

Another tip from AB to use `vtrl + p`

I have created Andrews in my Cognito with my email address and I used option to test using gmail + option. This helped me to display messages between Andrews. 

I have run into errors and couldn’t get messages to show but after restarting the workspace then rerunning DB set up, Cognito user update and DynamoDB seed I was able to come this obstacle. Now all is loading correctly. 

Also, I have fixed an error which React complained about where a class had `3 s` there. I found solution on discord but was able to find this problem myself by searching for Class`s` within files.


![Proof of returned andrew conversation](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/retunred_andrews_conversation.PNG)

I have learned in a hard way that when you’re tired is easy to make a mistake. I struggled to understand what I did wrong while trying to pass `uuid` to our `URL` and instead of `.` I used `_` to link `message_group.uiid`

![proof of uuid screenshot](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/uuid_in_url.PNG)

![proof of uuid screenshot number 2](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/uuid_in_url2.PNG)


We have replaced code in our `messages.py` file with a more simple one and we are using a class and method within to call our `message_group_uuid` We have started preparing our code to restrict views of messages which we will implement in later stages.

After a bit of struggle and going back and forward I have finally managed to get this to work! I was able to display list of grouped messages for our famous Andrews users.

![grouped messages screenshot](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/grou_messages.PNG)

![grouped messages screenshot 2](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/group_messages_frontend.PNG)


After a bit of struggle implementing the code to create new messages in the conversation, I finally got it. Problem was with the seed file for DynamoDB time format as messages were showing up with a negative value. Thanks to discord community I was able to solve this problem.

![Create a message action](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/create_msg_action_working.PNG)

Proof of users set up.

![List of users and other users returned](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/my_user_and_other_user_return.PNG)

## setting up Dynamo stream

I have successfully created new Lambda to access DynamoDB streams. In order for it to function we had to create a new policy and permission set for our function. After that we started to work on production DB. 

Here is a proof of a message sent in production. 

![Cloudwatch logs for prod messaged arrived](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/cloudwatch_logs_for_prod_message.PNG)

![Message un production](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/message_in_prod.PNG)

Proof of Lambda.

![New lambda function](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/week%205/new_lambda.PNG)


