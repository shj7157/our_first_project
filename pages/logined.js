//여기 스크립트는 모든 페이지에 삽입되어야함 (로그인,  조인 페이지 제외)
// 페이지 로드 시 로그인 상태 확인 모든페이지에 삽입
window.addEventListener("load", checkloginStatus());
function checkloginStatus() {
  // "check-login" 라우터를 호출하여 로그인 상태를 확인
  let userToken = { userToken: localStorage.getItem("token") };
  fetch(`http://localhost:3000/api/checklogin`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(userToken),
  })
    .then((response) => {
      if (response.status === 200) {
        return response.json();
      } else {
        throw new Error("로그인 상태 확인 실패");
      }
    })
    .then((data) => {
      console.log(data.success);
      if (data.success == true) {
        // 로그인된 경우
        document.getElementById("loginButtonContainer").style.display = "none";
        document.getElementById("logoutButtonContainer").style.display =
          "inline-block";
      } else {
        // 로그인되지 않은 경우
        document.getElementById("loginButtonContainer").style.display =
          "inline-block";
        document.getElementById("logoutButtonContainer").style.display = "none";
      }
    })
    .catch((error) => {
      console.error(error);
    });
}

//로그아웃 기능 구현 모든 페이지에 들어가도록

const logoutButtonClick = () => {
  let userToken = { userToken: localStorage.getItem("token") };
  fetch(`http://localhost:3000/api/logout`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(userToken),
  }).then((response) => {
    if (response.status === 204) {
      // 로그아웃 성공
      // 로컬 스토리지, 세션 스토리지에서 토큰을 삭제 또는 무효화
      localStorage.removeItem("token"); // 로컬 스토리지에서 토큰 삭제
      localStorage.removeItem("userId"); // 로컬 스토리지에서 토큰 삭제
      // 다른 로그아웃 관련 작업 수행
      setTimeout(() => {
        location.reload();
      }, 500);
    } else {
      // 로그아웃 실패
      console.error("로그아웃 실패");
    }
  });
};
