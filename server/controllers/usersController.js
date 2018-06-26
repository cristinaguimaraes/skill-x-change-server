const db = require('../models');

exports.me = async (req, res) =>{

};

exports.updateMe = async (req, res) =>{

};

exports.getUser = async (req, res) =>{
  const userId = req.params.id;
  const user = await db.User.findOne({
    where:{
      pk_user_id: userId,
    }
  });

  res.status = 200;
  res.send(user);

};
