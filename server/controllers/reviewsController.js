const db = require('../models');

exports.createReview = async (req, res) => {
  const conversationId = req.params.id;
  await db.Review.create ({
    fk_conversation_id: conversationId,
    description: req.body.description,
  });
  res.status = 201;
};
