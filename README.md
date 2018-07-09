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
  3. [Create the env file](#3-create-the-env-file)
  4. [Run the server](#4-run-the-server)
  5. [You are ready to set up the front end!](#5-you-are-ready-to-set-up-the-front-end)
  
## 1. Clone the Repo

Clone the `skill-x-change-server code` locally. In a terminal, run:

  `git clone https://github.com/cristinaguimaraes/singular-server.git`
  
## 2. Set up mySql

In the terminal in the server folder, run:

```
mysqladmin create singular_db -u <username> -p
mysql singular_db < SingularMockData.sql -u <username> -p

```


## 3. Create the env file

In your text editor create the .env file
  
 ```
ENV=develop
DB_PORT=3306
DB_USER='your mysql user'
DB_PASSWORD='your mysql password'
FB_APP_SECRET=
SERVER_PORT=3010
SERVER_IP=127.0.0.1
LOCARL_SERVER_IP=
``` 
## 4. Run the server

In a new tab in the terminal, run:
```
npm install
npm run dev
```

## 5. You are ready to set up the front end!

Navigate to [singular-client](https://github.com/CKGHarju/singular-client) and follow the instructions in the README.md to finish the setup and run the application.

# Project Contributors

- [Cristina Guimaraes](https://github.com/cristinaguimaraes), Back End
- [David Rebolleda](https://github.com/davidecorreu), Back End
- [Christopher Harju](https://github.com/CKGHarju/skill-x-change-client), Front End
- [Pablo Anttila](https://github.com/papplo), Front End
