const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

// Route for /mynode endpoint
app.get('/mynode', (req, res) => {
  res.send('Hello from Node.js Web App at /mynode!');
});

const server = app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

module.exports = server; // Export app and server for testing