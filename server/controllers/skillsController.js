const db = require('../models');


exports.getSkills = async (req, res) =>{
  const location = req.query.location;
  const categoryId = req.query.category_id;
  if (categoryId) {
    const skills = await db.Skill.findAll({
      where:{
        location: location,
        category: categoryId,
        delete: false
      }
    });
  } else {
    const allSkills = await db.Skill.findAll({
      where:{
        location: Barcelona,
        delete: false
      }
    });
    const shuffled = await allSkills.sort(() => 0.5 - Math.randon());
    const skills = shuffled.slice(0,15);
  }
  res.status = 200;
  res.send(skills);
};

exports.getSkill = async (req, res) =>{
  const skillId = req.params.id;
  const skill = await db.Skill.findOne({
    where:{
      pk_skill_id: skillId,
      delete: false
    }
  }).then((skill) => {
    return skill.increment('counter_visits');
  }).then((skill) => {
    res.send(skill);
  });
  // await db.Skill.increment({
  //   where:{
  //     pk_skill_id: skillId
  //   }
  // }, {
  //   counter_visits: 1}
  // );
  res.status = 200;
  // res.send(skill);
};

exports.createSkill = async (req, res) =>{
  await db.Skill.create ({
    title: req.body.tilte,
    description: req.body.description,
    img_url: req.body.img_url,
    location: req.body.location,
    fk_user_id: req.body.fk_user_id,
    fk_category_id: req.body.fk_category_id,
    delete: false,
    counter_visits: 0
  });

  res.status = 201;
};

exports.deleteSkill = async (req, res) =>{
  const skillId = req.params.id;
  await db.Skill.update({
    where:{
      pk_skill_id: skillId
    }
  }, {
    delete: true}
  );

  res.status = 200;
};
