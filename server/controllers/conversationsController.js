const db = require('../models');

exports.createConversation = async (req, res) =>{
  await db.Conversation.create ({
    fk_sender_user_id: req.body.fk_sender_user_id,
    fk_skill_id: req.body.fk_skill_id,
    approved: 0,
    request_message: req.body.request_message
  });
  res.status(201).send('Created!');
};

exports.getConversation = async (req, res) => {
  const conversationId = req.params.id;
  try {
    const conversation = await db.Conversation.findOne({
      where: {
        pk_conversation_id: conversationId
      },
      include: [
        {model: db.User,
          attributes: ['name', 'img_url']
        },
        {
          model: db.Skill,
          attributes: ['title'],
          include: {
            model: db.User,
            attributes: ['name', 'img_url', 'pk_user_id']
          }
        }
      ]
    });

    const conFiltered = {
      ...conversation.dataValues,
      sender_name: conversation.dataValues.User.name,
      sender_img_url: conversation.dataValues.User.img_url,
      skill_title: conversation.dataValues.Skill.title,
      skill_creator_name: conversation.dataValues.Skill.User.name,
      skill_creator_img_url: conversation.dataValues.Skill.User.img_url,
      skill_creator_id: conversation.dataValues.Skill.User.pk_user_id
    };
    delete conFiltered.Skill;
    delete conFiltered.User;

    const messages = await db.Message.findAll({
      where: {fk_conversation_id: conversationId}
    })
    conFiltered.messages = messages;
    res.send(conFiltered);
  } catch (e) {
    res.status = 404;
    res.send(e);
  }

};

exports.acceptConversation = async (req, res) =>{
  try {
    const conversationId = req.params.id;

    const dbRes = await db.Conversation.findOne({
      where:{
        pk_conversation_id: conversationId,
      }
      ,
      include: {
        model: db.Skill,
        include : {
          model: db.User,
          where: {
            pk_user_id: req.pk_user_id
          }
        }
      }
    });

    if (dbRes.dataValues.Skill) {
      const updateRes = await db.Conversation.update({
        approved: 1
      },
      {
        where:{
          pk_conversation_id: conversationId
        }
      });
      res.status(200).send({response: 'Accepted!'});
    } else {
      res.status(401).send({response: 'The user is not the creator of the Skill'});
    }

  }  catch (e) {
    res.status(404).send(e);
  }
};

exports.rejectConversation = async (req, res) =>{
  try {
    const conversationId = req.params.id;
    await db.Conversation.update({
      approved: 2
    }, {
      where:{
        pk_conversation_id: conversationId
      }
    });
    res.status(200).send({response: 'Rejected!'});
  }  catch (e) {
    res.status(404).send(e);
  }
};

exports.createMessage = async (req, res) => {
  try {
    const conversationId = req.params.id;
    await db.Message.create ({
      fk_conversation_id: conversationId,
      message: req.body.message,
    });
    res.status(201).send({response: 'Created!'});
  } catch (e) {
    res.status(404).send(e);
  }
};
