var express = require("express");
var router = express.Router();
const dba = require("../../util/dba");

/* GET users listing. */
router.post("/", async (req, res, next) => {
  let { userToken } = req.body;
  let selectUserTbQuery =
    "SELECT user_tb.user_name , user_tb.addr , user_tb.phone FROM user_tb WHERE id = ? ";
  let selectUserTbParams = [userToken];
  try {
    // 여기에서 dba.insert() 함수를 호출하고 에러 처리를 수행합니다.
    await dba.select(selectUserTbQuery, selectUserTbParams).then((result) => {
      if (result.length == 0) return console.log("No users");
      //console.log(result[0]);
      let userInfo = {
        userName: result[0].user_name,
        userAddr: result[0].addr,
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
