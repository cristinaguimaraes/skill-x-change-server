const db = require('../models');

exports.createConversation = async (req, res) =>{
  await db.Conversation.create ({
    fk_sender_user_id: req.body.fk_sender_user_id,
    fk_skill_id: req.body.fk_skill_id,
    approved: 0
  });
  res.status(201).send('Created!');
};

exports.acceptConversation = async (req, res) =>{
  try {
    const conversationId = req.params.id;
    await db.Conversation.update({
      approved: 1
    }, {
      where:{
        pk_conversation_id: conversationId
      }
    });
    res.status(200).send('Accepted!');
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
    res.status(200).send('Accepted!');
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
    res.status(201).send('Created!');
  } catch (e) {
    res.status(404).send(e);
  }
};
