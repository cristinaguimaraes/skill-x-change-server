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
      include: [db.User]
    });

    consFromSkillsFiltered = conversationsFromSkills.map(con => {
      const conFiltered = {
        ...con.dataValues,
        sender_name: con.dataValues.User.name,
        sender_img_url: con.dataValues.User.img_url,
      }
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
        skill_creator: con.dataValues.Skill.User.name,
        skill_creator_img_url: con.dataValues.Skill.User.img_url
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
      }
    });

    user.dataValues.skills = await skills;
    user.dataValues.reviews = await reviews;
    user.dataValues.conversationsFromSkills = consFromSkillsFiltered;
    user.dataValues.conversationsFromUser = consFromUserFiltered;
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
