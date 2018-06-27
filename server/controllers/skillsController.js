const db = require('../models');
const uuidv4 = require('uuid/v4');


exports.getSkills = async (req, res) =>{

  try {
    const location = req.query.location;
    const categoryId = req.query.category_id;
    if (categoryId) {
      const skills = await db.Skill.findAll({
        where:{
          location: location,
          fk_category_id: categoryId,
          deleted: 0
        }
      });
      res.status(200).send(skills);
    } else {
      const allSkills = await db.Skill.findAll({
        where:{
          location: location,
          deleted: 0
        }
      });
      const shuffled = await allSkills.sort((a,b) => {return 0.5 - Math.random();});
      const skills = shuffled.slice(0,3);
      res.status(200).send(skills);
    }
  //  res.status(200).send(skills);
  } catch (e) {
    res.status(404).send(e);
  }
};

exports.getSkill = async (req, res) =>{
  try {
    const skillId = req.params.id;
    const skill = await db.Skill.findOne({
      where:{
        pk_skill_id: skillId,
        deleted: 0
      }
    }).then((skill) => {
      return skill.increment('counter_visits');
    }).then((skill) => {
      res.status(200).send(skill);
    });
  } catch (e) {
    res.status(404).send(e);
  }
};


exports.createSkill = async (req, res) =>{
  try {
    await db.Skill.create({
      pk_skill_id: uuidv4(),
      title: req.body.title,
      description: req.body.description,
      img_url: req.body.img_url,
      location: req.body.location,
      fk_user_id: req.body.fk_user_id,
      fk_category_id: req.body.fk_category_id,
      deleted: 0,
      counter_visits: 0
    });
    res.status(201).send('Created!');
  } catch (e) {
    res.status(404).send(e);
  }

};

exports.deleteSkill = async (req, res) =>{
  try {
    const skillId = req.params.id;
    await db.Skill.update({
      deleted: 1}, {
      where:{
        pk_skill_id: skillId
      }
    });
    res.status(200).send('Deleted!');
  } catch (e) {
    res.status(404).send(e);
  }
};
