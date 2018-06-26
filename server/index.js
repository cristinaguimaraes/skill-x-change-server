const models = require('./models');

models.sequelize.sync().then(function () {

  console.log("Let's check the database!!!");
  // /**
  //  * Listen on provided port, on all network interfaces.
  //  */
  // app.listen(port, function () {
  //   //eslint-disable-next-line
  //   console.log('Koa app listening on port:', port);
  // });
});
