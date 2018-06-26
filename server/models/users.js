// User model

// Notes about Sequelize
// By default is creating an autoincrement id field
// It's also creating a couple of timestamps createdAt and updatedAt

'use strict';
module.exports = (sequelize, DataTypes) => {
  const User = sequelize.define('User', {
    // use the code below to get an incremental primaryKey with custom name
    // pk_user_id: {
    //   type: Sequelize.INTEGER,
    //   primaryKey: true,
    //   autoIncrement: true // Automatically gets converted to SERIAL for postgres
    //   }
    pk_user_id: {
      type: DataTypes.UUID,
      primaryKey: true,
      // the default value is used to automatically generate the id in MySQL
      defalultValue: DataTypes.UUIDV4
    },
    name: {type: DataTypes.STRING(30), allowNull: false},
    surname: {type: DataTypes.STRING(50), allowNull: false},
    email: {type: DataTypes.STRING, allowNull: false, unique: true},
    date_of_birth: {type: DataTypes.STRING(30)},
    nationality: {type: DataTypes.STRING(50)},
    description: {type: DataTypes.STRING(400)},
    last_login: {type: DataTypes.DATE, allowNull: false, defaultValue: DataTypes.NOW},
    current_location: {type: DataTypes.STRING},
    password: {type: DataTypes.STRING(50)},
    img_url: DataTypes.STRING,
    fb_id:{type: DataTypes.STRING, unique: true},
    auth_type: DataTypes.STRING(50),
  },
  {underscored: true});

  User.associate = (models) => {
    models.User.hasMany(models.Skill, {foreignKey: {name: 'fk_user_id', allowNull: false}});
    models.User.hasMany(models.Conversation, {foreignKey: {name:'fk_sender_user_id', allowNull: false}});
  };

  return User;
};
