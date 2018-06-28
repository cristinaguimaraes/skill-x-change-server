# skill-x-change-server
skill-x-change (working title) is a platform for creating social connections by teaching and learning from eachothers.

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

  `git clone https://github.com/cristinaguimaraes/skill-x-change-server.git`
  
## 2. Set up mySql

In the terminal, run:

```
mysql --password -u root
```

When prompted, enter the mySql password.

Then, run:

```
create database skill_x_change_db;

```
## 3. Create the env file

In your text editor create the .env file
  
 ```
ENV=develop
DB_PORT=3306
DB_USER='your mysql user'
DB_PASSWORD='your mysql password'
FB_APP_SECRET=
``` 
## 4. Run the server

In a new tab in the terminal, run:
```
npm install
node createCategories.js
npm run dev
```

## 5. You are ready to set up the front end!

Navigate to [skill-x-change-client](https://github.com/CKGHarju/skill-x-change-client) and follow the instructions in the README.md to finish the setup and run the application.
