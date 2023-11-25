var express = require("express");
var router = express.Router();
const dba = require("../../util/dba");
const path = require("path");

/* GET users listing. */
router.post("/", async (req, res, next) => {
  let rootUrl = "http://localhost:3000/images/";
  let resJson = {
    asd: true,
    images: [],
  };
  // const image = path.join(__dirname, "path/images/top1.jpg");
  // res.sendFile(image);
  let { goodsToken } = req.body;
  let selectGoodsTbQuery =
    "SELECT Goods_name , price , Goods_img_src FROM goods_tb WHERE Goods_no = ? ";
  let selectGoodsTbParams = [goodsToken];
  try {
    // 여기에서 dba.insert() 함수를 호출하고 에러 처리를 수행합니다.
    await dba.select(selectGoodsTbQuery, selectGoodsTbParams).then((result) => {
      if (result.length == 0) return console.log("No Goods");
      let GoodsInfo = {
        Goods_name: result[0].Goods_name,
        price: result[0].price,
        Goods_img_src: result[0].Goods_img_src,
      };
      return res.json(GoodsInfo);
    });
  } catch (err) {
    if ((err = "ER_DUP_ENTRY")) return res.json({ err: "ER_DUP_ENTRY" });
    // 이 부분에서 함수를 빠져나감
  }
});

module.exports = router;
