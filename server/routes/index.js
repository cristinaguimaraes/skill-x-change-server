var express = require('express');
const router = express.Router();

const { authorizeUser } = require('../middlewares/authMiddleware.js');
const usersController = require('../controllers/usersController.js');
const categoriesController = require('../controllers/categoriesController.js');
const skillsController = require('../controllers/skillsController.js');
const conversationsController = require('../controllers/conversationsController.js');
const reviewsController = require('../controllers/reviewsController.js');


router.get('/me', () => authorizeUser, usersController.me);
router.put('/me', authorizeUser, usersController.updateMe);
router.get('/user/:id', usersController.getUser);
router.get('/categories', categoriesController.getCategories);
router.get('/skills', skillsController.getSkills);
router.post('/skills', authorizeUser, skillsController.createSkill);
router.get('/skills/:id', skillsController.getSkill);
router.delete('/skills', authorizeUser, skillsController.deleteSkill);
router.post('/conversation', authorizeUser, conversationsController.createConversation);
router.put('/conversation/:id/accept', authorizeUser, conversationsController.acceptConversation);
router.put('/conversation/:id/reject', authorizeUser, conversationsController.rejectConversation);
router.post('/message/:id', authorizeUser, conversationsController.createMessage);
router.post('/review/:id', authorizeUser, reviewsController.createReview);

module.exports = router;
