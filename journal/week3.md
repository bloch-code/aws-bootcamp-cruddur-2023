# Week 3 — Decentralized Authentication

## Technical Tasks

* Provision via ClickOps a Amazon Cognito User Pool
* Install and configure Amplify client-side library for Amazon Congito
* Implement API calls to Amazon Coginto for custom login, signup, recovery and forgot password page
* Show conditional elements and data based on logged in or logged out
* Verify JWT Token server side to serve authenticated API endpoints in Flask Application

All task have been completed by me! Hurray! :sunglasses: :grinning:

---
### What I have learned?
---

**What is it and how it differs from normal auth?**

My first step was to get more understanding of what the decentralised auth do and what it is.

*Centralized identity management means IAM all happens in one environment. In a workplace setting, this looks like the user signing into a single workspace to access all the applications and tools they need. Decentralized identity management means IAM is spread out across multiple environments.*

*With decentralized authentication, also known as distributed identity management, users
access applications individually using a different set of credentials for each. This model
distributes users&#39; identities across the network, as each application must store and handle
its own user data.*

**Provision via ClickOps a Amazon Cognito User Pool**

User pool was created.
![User pool](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/ErrorExample.png)


## Backend authentication in cognito.

To implement backend authentication I have passed authentication token to our backend to authentication. 
With little help from StackOverflow we were able to implement our backend. 
<br>
https://stackoverflow.com/questions/29386995/how-to-get-http-headers-in-flask  

Good lesson learned that there is no server side auth verification required. All is handled by Congito! that's so much easier and quicker.

**How this was implemented? in more detail** 

We have grabbed verification service token from community driven project. This was more complicated then I expected. Even following Andrew was hard to do so. I would need to come back to this for sure!!!
Is too late to code now as my brain is fright!

**Following along....**

Good thing is that following Andrew he makes mistakes too and realised this errors much later. This is good learning experience to pay attention to details also good one for debugging. 


