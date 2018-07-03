const db = require('../models');

exports.createReview = async (req, res) => {
  try {
    const conversationId = req.params.id;
    await db.Review.create ({
      fk_conversation_id: conversationId,
      description: req.body.description,
    });
    res.status(201).send({response: 'The review has been created.'});
  } catch (e) {
    res.status(404).send(e);
  }
};
