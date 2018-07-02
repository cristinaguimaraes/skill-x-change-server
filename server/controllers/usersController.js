const db = require('../models');
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
    user.dataValues.conversations = conversations;
    res.status = 200;
    res.send(user);
  } catch (e) {
    res.status(404).send(e);
  }
};

exports.updateMe = async (req, res) =>{
  try {
    console.log(req.body);
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
      where: {
        fk_skill_id: skillsId
      },
      include: [{model: db.User,
                attributes : ['name', 'surname', 'img_url']}]
    });
    if(conversations.length >0) {
      const conversationsId = conversations.map(conversation => conversation.pk_conversation_id);
    const Sender = conversations.map(conversation => conversation.dataValues.User.dataValues)

    const reviews = await db.Review.findAll({
      where:{
        fk_conversation_id: {
          [Op.or]: conversationsId
        }
      }
    });
    const superReviews = reviews.map((review, index) => {
      const newReview = {...review.dataValues,
        sender_name: Sender[index].name,
        sender_surname: Sender[index].surname,
        sender_img: Sender[index].img_url
      }
      return newReview
    })
    user.dataValues.reviews = superReviews;
  } else {
    user.dataValues.reviews = [];
  }
    user.dataValues.skills =  skills;
    res.status = 200;
    res.send(user);
  } catch (e) {
    res.status(404).send(e);
  }
};
