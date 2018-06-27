const db = require('../models');
const uuidv4 = require('uuid/v4');
const Op = db.Sequelize.Op;

exports.me = async (req, res) =>{
  try {
    const userId = req.pk_user_id;
    const user = await db.User.findOne({
      where:{
        pk_user_id: userId,
      }
    });

    const skills = await db.Skill.findAll({
      where:{
        fk_user_id: userId,
        deleted: 0
      }
    });
    const skillsId = await skills.map(skill => skill.pk_skill_id);
    const conversations = await db.Conversation.findAll({
      where:{
        fk_skill_id: {
          [Op.or]: skillsId
        }
      }
    });
    const conversationsId = await conversations.map(conversation => conversation.pk_conversation_id);
    const reviews = await db.Review.findAll({
      where:{
        fk_conversation_id: {
          [Op.or]: conversationsId
        }
      }
    });
    user.dataValues.skills = await skills;
    user.dataValues.reviews = await reviews;
    res.status = 200;
    res.send(user);
  } catch (e) {
    res.status(404).send(e);
  }
};

exports.updateMe = async (req, res) =>{
  try {
    if (Object.keys(req.body).length > 7) return res.status(400)
    await db.User.update({
      ...req.body
    },{
      where:{
        pk_user_id: req.pk_user_id
      }
    });
    res.status(201).send('Created!');
  } catch (e) {
    res.status(404).send(e);
  }
};

exports.getUser = async (req, res) =>{
  try {
    const userId = req.params.id;
    const user = await db.User.findOne({
      where:{
        pk_user_id: userId,
      }
    });
    const skills = await db.Skill.findAll({
      where:{
        fk_user_id: userId,
        deleted: 0
      }
    });
    const skillsId = await skills.map(skill => skill.pk_skill_id);
    const conversations = await db.Conversation.findAll({
      where:{
        fk_skill_id: {
          [Op.or]: skillsId
        }
      }
    });
    const conversationsId = await conversations.map(conversation => conversation.pk_conversation_id);
    const reviews = await db.Review.findAll({
      where:{
        fk_conversation_id: {
          [Op.or]: conversationsId
        }
      }
    });
    user.dataValues.skills = await skills;
    user.dataValues.reviews = await reviews;

    res.status = 200;
    res.send(user);
  } catch (e) {
    res.status(404).send(e);
  }
};
