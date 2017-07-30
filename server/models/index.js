var db = require('../db');

module.exports = {
  messages: {
    get: function (callback) {

      var queryStr = 'select messages.table_id, messages.messages, messages.roomname, users.username from messages left outer join users on (messages.user_id = users.user_id) order by messages.table_id desc';

      db.query(queryStr, function (err, results) {
        if (err) console.log(err);
        callback(results);
      })
    },

    post: function (params, callback) {
      var queryStr = 'insert into messages set messages = ?, user_id = (select user_id from users where username = ? limit 1), roomname = ?';

      db.query(queryStr, params, function (err, results) {
        if (err) console.log(err);
        callback(results);
      })
    }
  },

  users: {
    get: function (callback) {

      callback(db.Users.findAll());

    },
    post: function (params, callback) {

      var queryStr = 'INSERT INTO users SET ?';

      db.query(queryStr, {username: params}, function (err, results) {
        if (err) console.log(err);
        callback(results);
      });

    }
  }
};

