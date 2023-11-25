//login.js
var express = require("express");
var router = express.Router();
const dba = require("../../util/dba");

/* GET users listing. */
router.post("/", async (req, res, next) => {
  let { userid, password } = req.body;
  console.log(userid);

  let query = "SELECT * FROM user_tb WHERE id=?";
  let params = [userid];
  dba.select(query, params).then((result) => {
    const user = result[0];
    if (result.length == 0)
      return res.status(401).json({ message: "아이디가 잘못되었습니다" });
    if (user.psw === password) {
      // 비밀번호가 일치하는 경우 - 로그인 성네
      req.session.userId = userid;
      console.log(req.sessionID);
      console.log(req.session);
      return res.json({
        success: true,
        token: req.sessionID,
        userid: userid,
        message: "로그인 성공",
      });
    } else {
      // 비밀번호가 일치하지 않는 경우 - 로그인 실패
      return res
        .status(401)
        .json({ success: false, message: "비밀번호가 일치하지 않습니다" });
    }
  });
});

module.exports = router;
