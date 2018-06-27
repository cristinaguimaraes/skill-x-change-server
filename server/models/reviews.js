// Review model
'use strict';
module.exports = (sequelize, DataTypes) => {
  const Review = sequelize.define('Review', {
    pk_review_id: {
      type: DataTypes.UUID,
      primaryKey: true,
      defaultValue: DataTypes.UUIDV4
    },
    description: {type: DataTypes.STRING(400), allowNull: false},
    // TODO : check if DataTypes.NOW is working properly
    time_stamp: {type: DataTypes.DATE, allowNull: false, defaultValue: DataTypes.NOW}
  },
  {underscored: true});

  // it has 1 Foreign key
  // fk_conversation_id
  Review.associate = (models) => {
    models.Review.belongsTo(models.Conversation,{
      onDelete: "CASCADE",
      foreignKey: { name : 'fk_conversation_id', allowNull: false }
    });
  };

  return Review;
};
