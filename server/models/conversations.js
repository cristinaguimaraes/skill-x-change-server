// Conversation model
'use strict';
module.exports = (sequelize, DataTypes) => {
  const Conversation = sequelize.define('Conversation', {
    pk_conversation_id: {
      type: DataTypes.UUID,
      primaryKey: true,
      defaultValue: DataTypes.UUIDV4
    },
    request_message: {type: DataTypes.STRING},
    approved: {type: DataTypes.INTEGER, allowNull: false, defaultValue: 0}
  },
  {underscored: true});

  // it has 2 Foreign keys
  // fk_sender_user_id
  // fk_skill_id

  Conversation.associate = (models) => {
    models.Conversation.hasMany(models.Message, {foreignKey: {name:'fk_conversation_id', allowNull: false}});
    models.Conversation.hasOne(models.Review, {foreignKey: {name:'fk_conversation_id', allowNull: false}});
    models.Conversation.belongsTo(models.Skill,{
      onDelete: 'CASCADE',
      foreignKey: { name : 'fk_skill_id', allowNull: false }
    });
    models.Conversation.belongsTo(models.User,{
      onDelete: 'CASCADE',
      foreignKey: { name : 'fk_sender_user_id', allowNull: false }
    });
  };

  return Conversation;
};
