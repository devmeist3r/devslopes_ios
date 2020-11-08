import mongodb from 'mongodb';

export default {
  port: 3005,
  mongoUrl: 'mongodb://localhost:27017/smack-chat-api',
  bodyLimit: '100kb',
};

// "port": process.env.PORT,
// "mongoUrl": process.env.MONGODB_URI,
