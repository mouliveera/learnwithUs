const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');

const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Connect to MongoDB (modify the connection string as needed)
mongoose.connect('mongodb://mongodb:27017/usersdb', { useNewUrlParser: true, useUnifiedTopology: true });

// Define a simple User schema
const userSchema = new mongoose.Schema({
  username: String
});

const User = mongoose.model('User', userSchema);

app.post('/addUser', (req, res) => {
  const username = req.body.username;
  if (username) {
    // Save the user to MongoDB
    const newUser = new User({ username });
    newUser.save((err) => {
      if (err) {
        console.error(err);
        res.status(500).send('Error saving user to database');
      } else {
        console.log('User added to MongoDB:', username);
        res.redirect('/');
      }
    });
  } else {
    res.status(400).send('Username is required');
  }
});

app.get('/getUsers', async (req, res) => {
  try {
    const users = await User.find({}, 'username');
    res.json(users);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error fetching users from database');
  }
});

app.listen(port, () => {
  console.log(`Backend app listening at http://localhost:${port}`);
});

