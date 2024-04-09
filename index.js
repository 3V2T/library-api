const express = require("express");
const app = express();
const cookieParser = require("body-parser");
const helmet = require("helmet");
const session = require("express-session");
const cors = require("cors");
const xss = require("xss-clean");
const PORT = 8080;
app.use(helmet());
app.use(
  session({
    secret: "secret-key",
    resave: false,
    saveUninitialized: false,
  })
);

app.use(
  cors({
    origin: [],
  })
);

app.use(xss());

app.listen(PORT, () => {
  console.log(`Server is listening on port ${PORT}`);
});
