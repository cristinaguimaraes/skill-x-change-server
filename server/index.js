const express = require('express');
const app = express();

const bodyParser = require('body-parser');
const cors = require('cors');

const errorMiddleware = require('./middlewares/errorMiddleware');
const authMiddleware = require('./middlewares/authMiddleware');
const routes = require('./routes/');
const models = require('./models');

app
  .use(cors())
  .use(bodyParser.json())
  .use(cors())
  .use(errorMiddleware)
  .use('/', routes);

models.sequelize.sync().then(function () {
  // eslint-disable-next-line
  console.log('Database already sync')
  app.listen(3000, () =>
  // eslint-disable-next-line
  console.log('Server listening on port 3000!'));
});
