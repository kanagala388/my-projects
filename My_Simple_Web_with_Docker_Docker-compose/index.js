const express = require("express");

const app = express();

app.get("/", (req, res) => {
  res.send("Hi,this is Bharath. Welcome to my web page");
});

app.listen(8080, () => {
  console.log("Listening on port 8080");
});
