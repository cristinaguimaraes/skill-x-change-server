const db = require('../models');
const uuidv4 = require('uuid/v4');

exports.createReview = async (req, res) => {
  try {
    const conversationId = req.params.id;
    await db.Review.create ({
      pk_review_id: uuidv4(),
      fk_conversation_id: conversationId,
      description: req.body.description,
    });
    res.status(201).send('Created!');
  } catch (e) {
    res.status(404).send(e);
  }
};
