// resources/js/login.js
document.addEventListener('DOMContentLoaded', function() {
  const loginForm = document.getElementById('loginForm');
  const loadingDiv = document.getElementById('loading');
  const errorDiv = document.getElementById('error-message');

  loginForm.addEventListener('submit', function(e) {
    e.preventDefault();

    // 로딩 표시
    loadingDiv.style.display = 'block';
    errorDiv.style.display = 'none';

    const formData = {
      username: document.getElementById('userid').value,
      password: document.getElementById('userpwd').value
    };

    fetch('/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json;charset=UTF-8'
      },
      body: JSON.stringify(formData)
    })
      .then(res => res.json())
      .then(data => {
        loadingDiv.style.display = 'none';

        if (data.success) {
          // 로그인 성공 시 대시보드로
          window.location.href = '/dashboard';
        } else {
          // 실패 메시지 보여주기
          errorDiv.textContent = data.message || '아이디 또는 비밀번호가 잘못되었습니다.';
          errorDiv.style.display = 'block';
        }
      })
      .catch(err => {
        loadingDiv.style.display = 'none';
        errorDiv.textContent = '서버 통신 중 오류가 발생했습니다.';
        errorDiv.style.display = 'block';
        console.error(err);
      });
  });
});
