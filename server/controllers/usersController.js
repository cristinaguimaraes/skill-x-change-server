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

    // search conversations that have skills belonging to the user
    const conversationsFromSkills = await db.Conversation.findAll({
      where: {
        fk_skill_id: {
          [Op.or]: skillsId
        }
      },
      include: [
        {model: db.User},
        {model: db.Skill,
          attributes: ['title']
          }
        ]
    });

    consFromSkillsFiltered = conversationsFromSkills.map(con => {
      const conFiltered = {
        ...con.dataValues,
        skill_title: con.dataValues.Skill.title,
        contact_name: con.dataValues.User.name,
        contact_img_url: con.dataValues.User.img_url
      }
      delete conFiltered.Skill;
      delete conFiltered.User;
      console.log('conFiltered:', conFiltered);
      return conFiltered;
    })

    // search conversations started by the user
    const conversationsFromUser = await db.Conversation.findAll({
      where: {
        fk_sender_user_id: userId
      },
      include : [{
        model: db.Skill,
        attributes: ['title'],
        include: [{
          model: db.User,
          attributes: ['name', 'img_url']
        }]
      }]
    });

    consFromUserFiltered = conversationsFromUser.map(con => {
      const conFiltered = {
        ...con.dataValues,
        skill_title: con.dataValues.Skill.title,
        contact_name: con.dataValues.Skill.User.name,
        contact_img_url: con.dataValues.Skill.User.img_url
      }
      delete conFiltered.Skill;
      console.log('conFiltered:', conFiltered);
      return conFiltered;
    });

    const conFromSkillsId = conversationsFromSkills.map(conv => conv.pk_conversation_id);
    const conFromUserId = conversationsFromUser.map(conv => conv.pk_conversation_id);
    const conversationsId = [...conFromSkillsId, ...conFromUserId];
    // TODO probably we only need the reviews from the user skills
    const reviews = await db.Review.findAll({
      where:{
        fk_conversation_id: {
          // [Op.or]: conversationsId
          [Op.or]: conFromSkillsId
        }
      },
      include: {model: db.Conversation,
        attributes: ['fk_sender_user_id'],
        include: [{model: db.User, attributes: ['name']}, {model: db.Skill, attributes: ['title']}]
      }
    });

    reviewsFiltered = reviews.map(review => {
      const reviewFiltered = {
        ...review.dataValues,
        reviewer_name: review.dataValues.Conversation.User.name,
        skill_title: review.dataValues.Conversation.Skill.title,
      }
      delete reviewFiltered.Conversation;
      console.log('reviewFiltered:', reviewFiltered);
      return reviewFiltered;
    });

    user.dataValues.skills = skills;
    user.dataValues.reviews = reviewsFiltered;
    user.dataValues.conversationsStartedByMe = consFromSkillsFiltered;
    user.dataValues.conversationsStartedByOthers = consFromUserFiltered;
    res.status = 200;
    res.send(user);
  } catch (e) {
    res.status = 404;
    res.send(e);
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
