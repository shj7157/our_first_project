var express = require("express");
var router = express.Router();
const dba = require("../../util/dba");

/* GET users listing. */
router.post("/", async (req, res, next) => {
  let { userid, password, username, addr, birth, phone } = req.body;
  let selectUserTbQuery = "SELECT * FROM user_tb WHERE id = ? ";
  let selectUserTbParams = [userid];
  try {
    // 여기에서 dba.insert() 함수를 호출하고 에러 처리를 수행합니다.
    await dba.select(selectUserTbQuery, selectUserTbParams).then((result) => {
      if (result.length == 0) return console.log("No users");
      console.log(result[0]);
      let userInfo = {
        userid: result[0].ID,
        userPwd: result[0].psw,
        userName: result[0].user_name,
        userAddr: result[0].addr,
        userBirth: result[0].birth,
        userPhone: result[0].phone,
      };
      return res.json(userInfo);
    });
  } catch (err) {
    if ((err = "ER_DUP_ENTRY")) return res.json({ err: "ER_DUP_ENTRY" });
    // 이 부분에서 함수를 빠져나감
  }
});

module.exports = router;
