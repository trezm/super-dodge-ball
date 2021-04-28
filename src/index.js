const express = require("express");
const fs = require("fs");
const app = express();
const http = require("http").Server(app);
const io = require("socket.io")(http);

const SCRIPT_REG_GEN = "<!-- insert:([^\\s]+) -->";
const SCRIPT_REG_ALL = RegExp(SCRIPT_REG_GEN, "g");
const SCRIPT_REG_SINGLE = RegExp(SCRIPT_REG_GEN);
console.log("Loading index file...");
let indexValue = fs.readFileSync(`${__dirname}/index.html`, "utf-8");

let matches = indexValue.match(SCRIPT_REG_ALL);

for (let tagMatch of matches) {
  const fileName = tagMatch.match(SCRIPT_REG_SINGLE)[1];
  const file = fs.readFileSync(`${__dirname}/${fileName}`, "utf-8");

  console.log(`\t loaded '${fileName}', ${file.length} bytes`);
  indexValue = indexValue.replace(tagMatch, file);
}

console.log("Loaded file.");

console.log("Starting server.");

app.get("/", function (req, res) {
  res.send(indexValue);
});
app.get("/*", function (req, res) {
  res.sendFile(req.url.split("?")[0], { root: __dirname });
});

io.on("connection", (socket) => {
  console.log("connected.");

  socket.on("joined", (msg) => {
    console.log(`Player ${msg} joined the game!`);

    socket.emit("welcome", `Welcome player ${msg}`);
  });
});

const port = process.env.PORT || 3000;
http.listen(port, () => {
  console.log(`listening on *:${port}`);
  console.log(`Open <code-server>.herokuapp.com/proxy/${port} to see game!`);
});
