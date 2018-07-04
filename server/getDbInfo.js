const db = require('./models');

const getSkills = async () => {
  const skills = await db.Skill.findAll({}, {include:[db.User]});
  console.log('skills:', skills.map((skill)=> skill.dataValues));
};

const getSkillsByUserId = async (user_id) => {
  const skills = await db.Skill.findAll({
    where: {
      fk_user_id: user_id,
    }
  });
  console.log('skills:', skills.map(skill=> skill.dataValues));
};

const deleteSkillsByCriteria = async (criteria) => {
  const skills = await db.Skill.destroy({
    where: criteria
  });
  console.log('skills:', skills.map(skill=> skill.dataValues));
};

// getSkillsByUserId('7a5ace07-7e37-408b-97a3-ca9d846dc42b');

const criteria = {
  fk_user_id: '7a5ace07-7e37-408b-97a3-ca9d846dc42b',
  description: ''
};

deleteSkillsByCriteria(criteria);
