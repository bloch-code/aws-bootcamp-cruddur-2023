# Week 5 — DynamoDB and Serverless Caching

Good walkthrough from Ashish about best security practices for Dynamo DB in AWS.

Furthermore I have learned about DAX.

What is DAX cluster in AWS? 

Amazon DynamoDB Accelerator (DAX) is a fully managed, highly available, in-memory cache for Amazon DynamoDB that delivers up to a 10 times performance 
improvement—from milliseconds to microseconds—even at millions of requests per second.

DAX operates within the VPC.

We had a good introduction from Kirk. Which he is serverless caching developer and Memento. Intersting subject that I don't know al ot abuot. 

This lecure is all about modeling and setting up DynamoDB. I have never worked with NO SQL database for real world scenario. 
All I know about Danmo DB is a NoSQL DB and uses Key and Value store storing data model. Key correspondse to value and this way you extract data from DB.

Andrew showed us a diagram which explaind in a visual way how our app which is direct messaging app is working and what data would we like to store in our DynamoDB.
Pre planning as always is a good excersise to do before we start coding and desiging things.

Questions to ask for DynamoDB desiging and preplanning: What data I need? When do I need it? How quickly do I need it? this would help us to desing our DB.

How do we do join in DynamoDB? There is no joints between tables as such like in SQL DB.
For our app we would only use one table design. 
Access patterns are used instead as a pattern for retriving data.

I have learned that DynamoDB has something called PartiQL where you can run queries on DynamoDB.
At this point I m not sure how to we retrieve data from DynamoDB if we're not using queries. 

DynamoDB has partition keys which act like primary keys in SQL DB. these keys can eb simple or composite. Also, DynamoDB has its own hash function. 

Andrew supervised by Kirk helped us to understand how data is modeled.

Two keys are used in NoSQL DynamodDB; partition and sort key. It is interesting to see single table desing for aplication. 

I have learned what is GSI and LSI in DynamoDB. For a newbie it is a valuable lesson. 

I didn't know you can write the whole JSON file into oe field to our NoSQL DB.

I have added boto3 to our installation. Boto is a python SDK for AWS.

We have reorganized our folder and file stracture as we're going to create more bash scripts for DyanmoDB this time.
I have learned about ising `**args` in python, definetly somethign I need to learn more about. 

I have populated schema-laod bash script followin Andrew instruction. To test our code we have run the bash command for schema. 
This created our table in dynamodb.

***screenshot for dynamodb table***

We then went to list our tables using bash file to check what we have. Also is good to know that using `\` we can write inline code in new line.

list_of_tables_using_bash

We have run our drop tabl script to test if it does delete tables. And it worked!

Now let's talk about a big fat file called seed where we went through each code section Adnrew preperaed and make sure that we know what the seed file does for us.
We have split our conversation into an array of string lines. Each line represents what a person 1 or 2 is saying in the cobversation, our test data.
Next we went through each line to distinguish between person 1 and 2.

I have learned about a good practice in bash scripts to use `else` to catch errors if it is not used in our logic to make action. Also that if input is simple such us variables separated instead of a dictionary then simpler output and easier to test our application. Good to remember that for the future projects.

I have learned how to find and define a path of files we want to use if they're not in the same directory. It is thropugh finding current and parrent paths and then appending sys path to reference correct value.

My development slowed down as I had a bug in my seed sql and didn't close an insert values statment with a  semicolon but a colon instead. this took me 30 min to realise. I'm even more impressed now how quickly Andrew debugs his errors.

I think I might fall for one of Andrews trapas as I couldn't get results for users if I haven't commented out uor create message function while following along with Andrew. At the end I got the confirmation that we have my user and other user replaced instead of user names. 

Definetly I would need to go through all the code again to properly understand everything into small details. It will eb good to learn bash scripting and use it more often to practice.
I have managed to create a conversation within our database following instructions in the video.

screenshot of conversation

Andrew helped us to create a scan for our local env to list data that we have in our database. 
This we achieved:
- Data has been inserted
- we seeded our data




screenshot of scan



We then moved forward and created a script to get us a list of coversation. Andrew helped us to get an output in a nice way, more human redable.

get_conversation_1
get_conversation_2

Not nice from AWS that it tells you to use uppercase but then in fact you need to use lower case.. As a sanity check we have narrow down our return results to come back with one message.

sanity_check_returns_one_message

As you can see by dates this is genuine me trying running a script :fire: I m so happy that it does run.

I have succesfully impleneted access patterns for dynamoDB. One obsticale was to implement a new function called `query_value`

We had to modify our `db.py` to take more parameters to print query function.

screenshot.
capacity_and_return_record

# Implement to fron end and back end application

For a start we created a library for DanamoDB.
Good lesson about state and stateless classes and that the second ones simplyfy testing as you only need to worry about I/O.
Another thing to remember is that our Cognito user id is called sub and also it is our uuid in our DBs.

I created a script to list users from cognito. This will help us access user id and dislay messages acordignaly.
list_users_in_cognito


we have run into error while trying to run our setup script.
err_running_setup

At the end error was due to uknown issue which we will address later along the line. Instead we have run our 1update_cognito_user_ids`.

Then we went and deleted our cookies set up from a bunch of JS files as we will no longer use it. 

I had to update uuid for my own user which meant to modify a code a bit as I don't have Andrews in my DB set correctly.

Another tip from AB to use `vtrl + p`

I have created Andrews in my cognito with my email address and I used option to test using gmail + option.
This helped me to display messages between Andrews. I have run into errors and couldn;t get messages to show but after restarting the workspace then rerunning DB set up, cognito user update and DynamoDB seed I was able to come this obstacle.
Now all is loading correctly. Also I have fixed an error which React complained about where a class had 3 `s` there. I found solution on discord but was able to find this problem myself by seraching for Class`s` within files.

retunred_andrews_conversation