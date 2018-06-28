const db = require('./models');
const uuidv4 = require('uuid/v4');

const categoryArr = [
  {
    'name': 'dance',
    'img_url': 'https://unsplash.com/photos/Yyk4OmVJAyE'
  },
  {
    'name': 'cooking',
    'img_url': 'https://unsplash.com/photos/vlXAcYROlKY'
  },
  {
    'name': 'nature',
    'img_url':'https://unsplash.com/photos/b82R8cnxfZg'
  },
  {
    'name': 'knowledge',
    'img_url':'https://unsplash.com/photos/a-AWnRtwlWM'
  },
  {
    'name': 'sport',
    'img_url':'https://unsplash.com/photos/PHIgYUGQPvU'

  }
];

// console.log('uuidv4 from sequelize', uuidv4());

categoryArr.forEach(async category => {
  await db.Category.create ({
    name: category.name,
    img_url: category.img_url
  });
});
