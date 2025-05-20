document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("searchForm");
  const keywordInput = document.getElementById("keywordInput");
  const sortSelect = document.getElementById("sortSelect");
  const autocompleteBox = document.getElementById("autocomplete-box");

  // ✅ contextPath는 메타태그에서 가져오기
  const contextPath = document.querySelector("meta[name='context-path']").content;

  // 1️⃣ 정렬 선택 시 자동 submit
  sortSelect.addEventListener("change", () => {
    form.submit();
  });

  // 2️⃣ 키워드 입력 시 자동완성 요청
  keywordInput.addEventListener("input", async (e) => {
    const query = e.target.value.trim();

    if (query.length === 0) {
      autocompleteBox.innerHTML = "";
      autocompleteBox.style.display = "none";
      return;
    }

    try {
      const response = await fetch(`${contextPath}/products/suggest?keyword=${encodeURIComponent(query)}`);
      const suggestions = await response.json();

      if (suggestions.length > 0) {
        autocompleteBox.innerHTML = suggestions
          .map(item => `<div class="suggest-item">${item}</div>`)
          .join("");
        autocompleteBox.style.display = "block";
      } else {
        autocompleteBox.style.display = "none";
      }

    } catch (err) {
      console.error("자동완성 오류:", err);
    }
  });

  // 3️⃣ 자동완성 클릭 시 input에 삽입
  autocompleteBox.addEventListener("click", (e) => {
    if (e.target.classList.contains("suggest-item")) {
      keywordInput.value = e.target.textContent;
      autocompleteBox.innerHTML = "";
      autocompleteBox.style.display = "none";
    }
  });

  // 4️⃣ 엔터 시 form submit
  keywordInput.addEventListener("keydown", (e) => {
    if (e.key === "Enter") {
      e.preventDefault();
      form.submit();
    }
  });

  // 5️⃣ input 외 영역 클릭 시 자동완성 닫기
  document.addEventListener("click", (e) => {
    if (!autocompleteBox.contains(e.target) && e.target !== keywordInput) {
      autocompleteBox.innerHTML = "";
      autocompleteBox.style.display = "none";
    }
  });
});
