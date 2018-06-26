const express = require('express');
const app = express();

const bodyParser = require('body-parser');
const cors = require('cors');

const errorMiddleware = require('./middlewares/errorMiddleware');
const authMiddleware = require('./middlewares/authMiddleware');
const routes = require('./routes/');

app
  .use(cors())
  .use(bodyParser.json())
  .use(cors())
  .use(errorMiddleware)
  .use('/', routes);


app.listen(3000, () => console.log('Server listening on port 3000!'));
