'use strict';

const fs        = require('fs');
const path      = require('path');
const Sequelize = require('sequelize');
const basename  = path.basename(__filename);
const db        = {};
require('dotenv').config({path:__dirname+'/./../../.env'});

const dbPort = process.env.DB_PORT || 3306;

// use this line if you are hosting the database
// console.log('process.env.DB_LOCAL_NETWORK_IP:',process.env.DB_LOCAL_NETWORK_IP, 'process.env.DB_LOCAL_HOST_IP:',process.env.DB_LOCAL_HOST_IP);
const dbHostIp = process.env.DB_LOCAL_NETWORK_IP || process.env.DB_LOCAL_HOST_IP || '127.0.0.1';

// use this line if you are connecting to local network database
// const hostIp = process.env.LOCAL_SERVER_IP;

const sequelize = new Sequelize('singular_db', process.env.DB_USER, process.env.DB_PASSWORD, {
  host: dbHostIp,
  dialect: 'mysql',
  port: dbPort,

  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
});

fs
  .readdirSync(__dirname)
  .filter(file => {
    return (file.indexOf('.') !== 0) && (file !== basename) && (file.slice(-3) === '.js');
  })
  .forEach(file => {
    const model = sequelize['import'](path.join(__dirname, file));
    db[model.name] = model;
  });

Object.keys(db).forEach(modelName => {
  if (db[modelName].associate) {
    db[modelName].associate(db);
  }
});

db.sequelize = sequelize;
db.Sequelize = Sequelize;

module.exports = db;
