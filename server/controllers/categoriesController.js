const db = require('../models');

exports.getCategories = async (req, res) =>{
  const categories = await db.Category.findAll({});
  res.status = 200;
  res.send(categories);
};
