var express = require("express");
var router = express.Router();
const dba = require("../../util/dba");
const path = require("path");

/* GET users listing. */
router.post("/", async (req, res, next) => {
  let { userId, buyToken, Goods_q } = req.body;
  let insertoderTbQuery =
    "INSERT INTO order_tb (user_id, goods_no, or_q, date) VALUES (?, ?, ?, NOW())";
  let insertorderTbParams = [userId, buyToken, Goods_q];
  console.log(Goods_q);
  try {
    await dba.insert(insertoderTbQuery, insertorderTbParams).then((result2) => {
      //console.log(result2);
      res.json(result2);
    });
  } catch (err) {
    if ((err = "ER_DUP_ENTRY")) return res.json({ err: "ER_DUP_ENTRY" });
    // 이 부분에서 함수를 빠져나감
  }
});

module.exports = router;
