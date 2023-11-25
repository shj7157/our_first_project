var express = require("express");
var router = express.Router();
const dba = require("../../util/dba");

router.post("/", async (req, res, next) => {
  let { userId, newPassword, userName, userAddr, userBirth, userPhone } =
    req.body;
  console.log(`User ${userId}`);
  // 여기에서 사용자 정보를 업데이트하는 코드를 작성합니다.
  // 쿼리문을 사용해 데이터베이스에서 사용자 정보를 업데이트하고 결과를 처리합니다.
  let updateQuery =
    "UPDATE user_tb SET ID = ?, psw = ?, user_name = ?, addr = ?, birth = ?, phone = ? WHERE ID = ?";
  let updateParams = [
    userId,
    newPassword,
    userName,
    userAddr,
    userBirth,
    userPhone,
    userId,
  ];
  try {
    await dba.update(updateQuery, updateParams); // 이 부분은 dba 모듈을 사용해 데이터베이스 업데이트를 수행합니다.

    // 업데이트 성공 시 응답을 반환합니다.
    return res.json({ message: "사용자 정보가 업데이트되었습니다." });
  } catch (error) {
    console.error("사용자 정보 업데이트 중에 오류 발생:", error);

    // 업데이트 실패 시 오류 응답을 반환합니다.
    return res.status(500).json({ error: "사용자 정보 업데이트 실패" });
  }
});

module.exports = router;
