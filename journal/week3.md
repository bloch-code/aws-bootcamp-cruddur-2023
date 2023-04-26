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
![User pool](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/user_pool.PNG)

**Install and configure Amplify client-side library for Amazon Congito & Implement API calls to Amazon Coginto for custom login, signup, recovery and forgot password page 7 Show conditional elements and data based on logged in or logged out**

Code was successfully added to multile places (HomeFeedPage, SigUpPage, SiginPage, ConfirmationPage) and user registration worked with user auto creation on our website.

**Proof Below with screenshots**

Activation code was sent out.

![Activation code](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/ativationcodesend.PNG)

Confirmed user in AWS Cognito.

![Confirmed users in AWS cognito](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/confirmed_userincognito.PNG)

Here is two auth code in Gmail. One was resend as a proof of resends funtionality.

![Resend auth code](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/gmail_resend_confirmation.PNG)

Authenticated and logged in user.

![Logged in Cruddur user](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/logged_in_user.PNG)

Error message when no email was provided.

![Error msg for authentication code](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/resend_code_error_msg.PNG)

Password reset code proof.

![Password reset proof](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/pasword_reset_code.PNG)



## Backend authentication in cognito.

To implement backend authentication I have passed authentication token to our backend to authentication. 
With little help from StackOverflow we were able to implement our backend. 
<br>
https://stackoverflow.com/questions/29386995/how-to-get-http-headers-in-flask  

Good lesson learned that there is no server side auth verification required. All is handled by Congito! that's so much easier and quicker.

**How this was implemented? in more detail** 

We have grabbed verification service token from community driven project. This was more complicated then I expected. Even following Andrew was hard to do so. At the end I have managed to set up everything correctly and authentication was working. 

Proof below...


![Proof of authentication](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/jwt_api_authenticated_user.PNG)

Below there are proofs of how one message is visible to authenticated / logged in user and then is not when user is logged out. 
![Proof of authentication nr2](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/no_secret_message_when_logged_out.PNG)

![Proof of authentication nr3](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/secret_message_for_logged_users.PNG)

**Following along....**

Good thing is that following Andrew he makes mistakes too and realised these errors much later. This is good learning experience to pay attention to details also good one for debugging. 


