var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

router.get('/:id/:pw', function(req, res, next){
  let id = req.params.id
  let pw = req.params.pw
  if(id == "aaa" && pw == "bbb")
    res.send('성공 ' + req.params.id + " " + req.params.pw);
  else res.send('싷패')
})

module.exports = router;
