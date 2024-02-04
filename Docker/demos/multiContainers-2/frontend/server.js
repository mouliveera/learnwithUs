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

// Route to add a user
app.post('/addUser', async (req, res) => {
  try {
    const { username } = req.body;
    if (!username) {
      return res.status(400).send('Username is required');
    }

    // Save the user to MongoDB
    const newUser = new User({ username });
    await newUser.save();

    console.log('User added to MongoDB:', username);
    res.json({ username }); // Respond with the added user
  } catch (err) {
    console.error(err);
    res.status(500).send('Error saving user to database');
  }
});

// Route to get all users
app.get('/getUsers', async (req, res) => {
  try {
    const users = await User.find({}, 'username');
    res.json(users);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error fetching users from database');
  }
});

// Default route
app.get('/', (req, res) => {
  res.send('Backend server is running.');
});

app.listen(port, () => {
  console.log(`Backend app listening at http://localhost:${port}`);
});

