const fetch = require('node-fetch');
const db = require('../models');

const CryptoJS = require('crypto-js');
require('dotenv').config({path:__dirname+'/./../../.env'});


exports.authorizeUser = async (req, res, next) => {
  // if (process.env.SKIP_AUTH) next();
  console.log('---------- inside authorizeUser ----------');

  const authHeader = req.headers.authorization;

  if (!authHeader) {
    res.status(401).send('There is no authorization header');
    return;
  }

  const token = authHeader.split('Bearer ')[1];

  // Generating the appsecret_proof
  //
  // It's way to make calls to the fb server in a protected way
  // the user token can be stolen in the client side, but without this
  // appsecret_proof facebook server won't respond to any petition

  const appSecret = process.env.FB_APP_SECRET;
  const appsecretProof = CryptoJS.HmacSHA256(token, appSecret).toString(CryptoJS.enc.Hex);
  const baseUrl = 'https://graph.facebook.com/me?fields=id,name,email,picture,first_name,last_name,middle_name,name_format,short_name&access_token=';
  console.log('=====>>>>> before fb call');
  const response = await fetch(baseUrl+token+'&appsecret_proof='+appsecretProof);
  console.log('=====>>>>> after fb call');

  const fb_res = await response.json();

  if (fb_res.hasOwnProperty('error')) {
    res.status(401).send(fb_res.error.message);
    return;
  }

  const user = await db.User.findOne({where : { fb_id: fb_res.id}});

  let pictureData = await fetch('https://graph.facebook.com/' + fb_res.id + '/picture?type=large&width=200&height=200&redirect=0');
  pictureData =  await pictureData.json();
  const pictUrl = pictureData.data.url;

  let userObj = {};
  let userFromDb;
  if (user) {
    userObj = {
      name: fb_res.first_name,
      email: fb_res.email,
      img_url: pictUrl
    };
    userFromDb = await db.User.update(userObj, {where: {fb_id: fb_res.id}});
    req.pk_user_id = user.pk_user_id;
  } else {
    userObj = {
      name: fb_res.first_name,
      surname: fb_res.last_name,
      email: fb_res.email,
      fb_id: fb_res.id,
      img_url: pictUrl
    };
    userFromDb = await db.User.create(userObj);
    req.pk_user_id = userFromDb.dataValues.pk_user_id;
  }

  next();
};
