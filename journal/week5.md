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





