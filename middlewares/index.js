const { verifyAccessToken } = require("../ultis");

const authen = (req, res, next) => {
  const authorization = req.headers.authorization;
  if (authorization) {
    const token = authorization.split(" ")[1];
    try {
      const user = verifyAccessToken(token);
      req.user = user;
      next();
    } catch (error) {
      res.status(401).json({ msg: "Unauthorization" });
    }
  } else {
    res.status(401).json({ msg: "Unauthorization" });
  }
};

module.exports = { authen };
