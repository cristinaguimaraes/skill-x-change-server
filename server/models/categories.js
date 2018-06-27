// Category model
'use strict';
module.exports = (sequelize, DataTypes) => {
  const Category = sequelize.define('Category', {
    pk_category_id: {
      type: DataTypes.UUID,
      primaryKey: true,
      defaultValue: DataTypes.UUIDV4
    },
    name: {type: DataTypes.STRING(30), allowNull: false},
    img_url: {type: DataTypes.STRING}
  },
  {underscored: true});

  Category.associate = (models) => {
    models.Category.hasMany(models.Skill, {foreignKey: {name: 'fk_category_id', allowNull: false}});
  };

  return Category;
};
