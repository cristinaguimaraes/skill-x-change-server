const errorHandler = async (req, res, next) => {
  try {
    await next();
  } catch (err) {
    //eslint-disable-next-line
    console.error(err);
    req.body = undefined;
    req.status = req.status >= 400 &&  req.status || 400;
    if (err.message) {
      req.body = {
        errors: [err.message]
      };
    }
  }
};

module.exports = errorHandler;
