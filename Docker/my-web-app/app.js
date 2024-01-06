const express = require('express');
const app = express();
const port = 8080;

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/public/index.html'); // Serving the review page
});

app.get('/payment', (req, res) => {
  res.sendFile(__dirname + '/public/payment.html'); // Serving the bank payment page
});

// Other routes and application logic

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

