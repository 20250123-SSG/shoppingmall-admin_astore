document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("searchForm");
  const keywordInput = document.getElementById("keywordInput");
  const sortSelect = document.getElementById("sortSelect");
  const sortHidden = document.getElementById("sortHidden");
  const autocompleteBox = document.getElementById("autocomplete-box");

  // 필수 요소 존재 확인
  if (!form || !keywordInput || !sortSelect || !sortHidden || !autocompleteBox) {
    console.error("필수 요소가 누락되었습니다.");
    return;
  }

  // contextPath 확보
  const metaTag = document.querySelector("meta[name='context-path']");
  const contextPath = metaTag ? metaTag.content : "";

  //  정렬 선택 시 sortHidden 갱신 후 폼 제출
  sortSelect.addEventListener("change", () => {
    sortHidden.value = sortSelect.value;
    form.submit();
  });

  // 자동완성 요청
  keywordInput.addEventListener("input", async (e) => {
    const query = e.target.value.trim();

    if (query.length === 0) {
      autocompleteBox.innerHTML = "";
      autocompleteBox.style.display = "none";
      return;
    }

    try {
      const response = await fetch(`${contextPath}/products/suggest?keyword=${encodeURIComponent(query)}`);
      if (!response.ok) throw new Error("서버 응답 오류");

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

  // 3️⃣ 자동완성 클릭 시 값 입력 후 닫기
  autocompleteBox.addEventListener("click", (e) => {
    if (e.target.classList.contains("suggest-item")) {
      keywordInput.value = e.target.textContent;
      setTimeout(() => {
        autocompleteBox.innerHTML = "";
        autocompleteBox.style.display = "none";
      }, 0);
    }
  });

  // 4️⃣ Enter 입력 시 폼 제출
  keywordInput.addEventListener("keydown", (e) => {
    if (e.key === "Enter") {
      e.preventDefault();
      form.submit();
    }
  });

  // 5️⃣ input 외 클릭 시 자동완성 닫기
  document.addEventListener("click", (e) => {
    if (!autocompleteBox.contains(e.target) && e.target !== keywordInput) {
      autocompleteBox.innerHTML = "";
      autocompleteBox.style.display = "none";
    }
  });
});
