var express = require('express');
var router = express.Router();

const Auth = (req, res , next) =>{
  const {user} = req.session;
  if(user != undefined){
      next()
  }else {
      res.send(alertMove("로그인이 필요합니다."))
  }
};

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('banner.html')
  // res.send(alertMove("로그인됨"))
});

router.post('/login', (req, res) => {
  const { username } = req.body; // 사용자의 로그인 정보를 얻어옴
  req.session.user = { username }; // 세션에 사용자 정보 저장
  res.send('로그인 완료');
});

module.exports = router;
