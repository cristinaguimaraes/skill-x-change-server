# singular-server

Singular is a platform to explore and connect with peers through the power of learning and teaching.

Singular is open and free to use, it enables a user to curate his profile and offer to teach unique skills to the community of users, all in a simple and friendly interface coupled to a secure login.

![Uses ecmascript](https://forthebadge.com/images/badges/uses-js.svg)

# Running the Backend

## Prerequisite
- [npm] (https://www.npmjs.com/)  
- [mySql] (https://www.mysql.com/)
- [Node] (https://nodejs.org/en/)

## Steps
    1. [Clone the repo](#1-clone-the-repo)
    2. [Set up mySql](#2-set-up-mysql)
    3. [Create a facebook app](#3-create-a-facebook-app)
    4. [Create the .env file](#4-create-the-.env-file)
    5. [Run the server](#5-run-the-server)
    6. [You are ready to set up the front end!](#6-you-are-ready-to-set-up-the-front-end)

## 1. Clone the Repo

Clone the `skill-x-change-server code` locally. In a terminal, run:

  `git clone https://github.com/cristinaguimaraes/singular-server.git`

## 2. Set up mySql

You should have installed MySQL in your computer. 

In the terminal, run:

```
mysqladmin create singular_db -u <username> -p
mysql singular_db < SingularMockData.sql -u <username> -p
```

This command will create the singular_db and dump the mock data into it.

##3. Create a Facebook app 

Just go to facebook developers site and create a new app. Then go to settings/advance and activate 'Require App Secret'. You'll need it in the next section.

## 4. Create the .env file

In your text editor create the .env file

 ```
ENV=develop
DB_USER=<your mysql user>
DB_PASSWORD=<your mysql password>
DB_PORT=3306
DB_LOCAL_HOST_IP=127.0.0.1
DB_LOCAL_NETWORK_IP=
FB_APP_SECRET=
SERVER_PORT=3010
 ```
The DB_LOCAL_NETWORK_IP is used to connect the database into your local network. While our team where developing this app we are all connected to the same database. If you don't specify it  the server will work using your local MySQL database.

## 5. Run the server

In a new tab in the terminal, run:
```
npm install
npm run dev
```

## 6. You are ready to set up the front end!

Navigate to [singular-client](https://github.com/CKGHarju/singular-client) and follow the instructions in the README.md to finish the setup and run the application.
