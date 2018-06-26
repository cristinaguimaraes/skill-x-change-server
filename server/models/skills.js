// Skill model
'use strict';
module.exports = (sequelize, DataTypes) => {
  const Skill = sequelize.define('Skill', {
    pk_skill_id: {
      type: DataTypes.UUID,
      primaryKey: true,
      defalultValue: DataTypes.UUIDV4
    },
    title: {type: DataTypes.STRING(50), allowNull: false},
    description: {type: DataTypes.STRING(400)},
    location: {type: DataTypes.STRING, allowNull: false},
    counter_visits: {type: DataTypes.INTEGER, defalultValue: 0},
    deleted: {type: DataTypes.BOOLEAN, defalultValue: false},
    img_url: {type: DataTypes.STRING}
  },
  {underscored: true});

  // it has 2 Foreign keys
  // fk_user_id
  // fk_category_id

  Skill.associate = (models) => {
    models.Skill.hasMany(models.Conversation, {foreignKey: {name:'fk_skill_id', allowNull: false}});
    models.Skill.belongsTo(models.Category,{
      onDelete: "CASCADE",
      foreignKey: { name : 'fk_category_id', allowNull: false }
    });
    models.Skill.belongsTo(models.User,{
      onDelete: "CASCADE",
      foreignKey: { name : 'fk_user_id', allowNull: false }
    });
  };

  return Skill;
};
