const db = require('./models');

// create mock data
// user name and categories must created in advance
// if the skill title is already in the db for the given user
// it will skip the creation of the skill to avoid duplicates
const skillArr = [
  {
    title: '10k run',
    description: 'Share a run by shore of Barcelona beach',
    location: 'Barcelona',
    user_name: 'David',
    category_name: 'sport'
  },
  {
    title: 'Trekking to the magic mountain, Montserrat',
    description: 'If you like hiking come to one of the most caracteristic mountain in Catalonia',
    location: 'Barcelona',
    user_name: 'Marc',
    category_name: 'nature'
  }
  // ,
  // {
  //   title: '',
  //   description: '',
  //   location: 'Barcelona',
  //   user_name: '',
  //   category_name: ''
  // }
];

skillArr.forEach(async skill => {
  try {
    // find the user
    const user = await db.User.findOne ({
      where: {name: skill.user_name}
    });
    // find the category
    const category = await db.Category.findOne({
      where: {name: skill.category_name}
    });

    // add logic to not create the same skills for the given user
    const alreadyInDb = await db.Skill.findOne({
      // where: {title: skill.title}
      where: {title: skill.title, fk_user_id: user.pk_user_id}
    });

    if (!alreadyInDb) {
      // create the Skill
      await db.Skill.create({
        title: skill.title,
        description: skill.description,
        location: skill.location,
        fk_user_id: user.pk_user_id,
        fk_category_id: category.pk_category_id
      });
    }

  } catch (e) {
    console.log('catch block containg the db calls, error:', e);
  }
});
