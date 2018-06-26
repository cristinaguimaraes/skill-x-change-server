const db = require('../models');


exports.createConversation = async (req, res) =>{
  await db.Conversation.create ({
    fk_sender_user_id: req.body.fk_sender_user_id,
    fk_skill_id: req.body.fk_skill_id,
    approved: 0
  });
  res.status = 201;
};

exports.acceptConversation = async (req, res) =>{
  const conversationId = req.params.id;
  await db.Skill.update({
    where:{
      pk_conversation_id: conversationId
    }
  }, {
    approved: 1}
  );
  res.status = 200;
};

exports.rejectConversation = async (req, res) =>{
  const conversationId = req.params.id;
  await db.Skill.update({
    where:{
      pk_conversation_id: conversationId
    }
  }, {
    approved: 2}
  );
  res.status = 200;
};

exports.createMessage = async (req, res) => {
  const conversationId = req.params.id;
  await db.Message.create ({
    fk_conversation_id: conversationId,
    message: req.body.messsage,
  });
  res.status = 201;
};
