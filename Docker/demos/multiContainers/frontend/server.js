const express = require('express');
const app = express();
const port = 8080;

app.get('/', (req, res) => {
  res.send('Hello from the frontend!');
});

app.listen(port, () => {
  console.log(`Frontend app listening at http://localhost:${port}`);
});

