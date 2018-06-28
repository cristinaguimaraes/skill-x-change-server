const db = require('./models');

const categoryArr = [

  {
    'name': 'dance',
    'img_url': 'https://images.unsplash.com/photo-1523450001312-faa4e2e37f0f?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a6653dc02f5f0e392f58139eef81b559&auto=format&fit=crop&w=2134&q=80'
  },

  {
    'name': 'cooking',
    'img_url': 'https://images.unsplash.com/photo-1453831362806-3d5577f014a4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9dd8da96be0724ab84e4147d428f6bba&auto=format&fit=crop&w=1938&q=80'
  },

  {
    'name': 'nature',
    'img_url':'https://images.unsplash.com/photo-1443372389995-a1b4810d99c7?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=289181ea63f3e277542d2448cfd9f85d&auto=format&fit=crop&w=1950&q=80'
  },

  {
    'name': 'knowledge',
    'img_url':'https://images.unsplash.com/photo-1496104679561-38d3af73f9b0?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=f6bbafb7818c9607c9b384cb2ff9102f&auto=format&fit=crop&w=961&q=80'
  },

  {
    'name': 'sport',
    'img_url':'https://images.unsplash.com/photo-1476480862126-209bfaa8edc8?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=41900ca14b1acd536efbaf79f09e2632&auto=format&fit=crop&w=1950&q=80'
  }

];

categoryArr.forEach(async category => {
  await db.Category.create ({
    name: category.name,
    img_url: category.img_url
  });
});
