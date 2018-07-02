// Message model
'use strict';
module.exports = (sequelize, DataTypes) => {
  const Message = sequelize.define('Message', {
    pk_message_id: {
      type: DataTypes.UUID,
      primaryKey: true,
      defaultValue: DataTypes.UUIDV4
    },
    // TODO : check if Sequelize.NOW is working properly
    time_stamp: {type: DataTypes.DATE, allowNull: false, defaultValue: DataTypes.NOW},
    // message_creator: false for Skill creatror, true for the User requesting the skill
    message_creator_id: {type: DataTypes.UUID, allowNull: false},
    message: {type: DataTypes.STRING, allowNull: false}
  },
  {underscored: true});

  // it has 1 Foreign key
  // fk_conversation_id
  Message.associate = (models) => {
    models.Message.belongsTo(models.Conversation,{
      onDelete: "CASCADE",
      foreignKey: { name : 'fk_conversation_id', allowNull: false }
    });
  };

  return Message;
};
