const db = require('./models');

const getSkills = async () => {
  const skills = await db.Skill.findAll({}, {include:[db.User]});
  console.log('skills:', skills.map((skill)=> skill.dataValues));
};

getSkills();
