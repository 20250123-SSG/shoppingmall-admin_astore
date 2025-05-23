document.addEventListener("DOMContentLoaded", function () {
  const colorSelect = document.getElementById("colorSelect");
  const ramSelect = document.getElementById("ramSelect");
  const sizeSelect = document.getElementById("sizeSelect");
  const priceArea = document.getElementById("priceDisplay");
  const contextPath = document.querySelector("meta[name='context-path']")?.content || '';



  const colors = new Set();
  const rams = new Set();
  const sizes = new Set();

  // 모델 옵션 중복 제거 후 select 요소 채우기
  modelOptions.forEach(opt => {
    colors.add(opt.color);
    rams.add(opt.ram);
    sizes.add(opt.size);
  });

  for (const color of colors) {
    const option = document.createElement("option");
    option.value = color;
    option.textContent = color;
    colorSelect.appendChild(option);
  }

  for (const ram of rams) {
    const option = document.createElement("option");
    option.value = ram;
    option.textContent = ram;
    ramSelect.appendChild(option);
  }

  for (const size of sizes) {
    const option = document.createElement("option");
    option.value = size;
    option.textContent = size + " inch";
    sizeSelect.appendChild(option);
  }

  // 가격 자동 업데이트
  [colorSelect, ramSelect, sizeSelect].forEach(select => {
    select.addEventListener("change", updatePrice);
  });

  function updatePrice() {
    const selectedColor = colorSelect.value;
    const selectedRam = ramSelect.value;
    const selectedSize = sizeSelect.value;

    const matched = modelOptions.find(opt =>
      opt.color === selectedColor &&
      opt.ram === selectedRam &&
      opt.size == selectedSize
    );

    priceArea.textContent = matched ? `${matched.optionalModelPrice.toLocaleString()}원` : "해당 옵션 없음";
  }
});
const contextPath = document.querySelector("meta[name='context-path']")?.content || '';

function deleteOption() {
  const selectedColor = colorSelect.value;
  const selectedRam = ramSelect.value;
  const selectedSize = sizeSelect.value;

  if (!selectedColor || !selectedRam || !selectedSize) {
    alert("옵션을 모두 선택해주세요.");
    return;
  }

  if (!confirm("해당 옵션을 삭제하시겠습니까?")) return;

  const form = document.createElement("form");
  form.method = "post";
  form.action = `${contextPath}/products/options/remove`;

  const inputs = [
    { name: "color", value: selectedColor },
    { name: "ram", value: selectedRam },
    { name: "size", value: selectedSize }
  ];

  inputs.forEach(({ name, value }) => {
    const input = document.createElement("input");
    input.type = "hidden";
    input.name = name;
    input.value = value;
    form.appendChild(input);
  });

  document.body.appendChild(form);
  form.submit();
}
window.editOption = function() {
  const selectedColor = colorSelect.value;
  const selectedRam = ramSelect.value;
  const selectedSize = sizeSelect.value;

  if (!selectedColor || !selectedRam || !selectedSize) {
    alert("옵션을 모두 선택해주세요.");
    return;
  }

  const matched = modelOptions.find(opt =>
    opt.color === selectedColor &&
    opt.ram === selectedRam &&
    opt.size === selectedSize
  );

  if (!matched) {
    alert("선택한 옵션이 존재하지 않습니다.");
    return;
  }
  const imagePath = "/upload/" + matched.modelName + "_" + matched.color + "_" + matched.ram + "_" + matched.size + ".png";


  // src에 반영
  const modelImage = document.getElementById("modelImage");
  modelImage.src = imagePath;

  const form = document.createElement("form");
  form.method = "GET";
  form.action = `${contextPath}/products/edit.page`;

  // 필수 데이터를 먼저 추가
  const essentialFields = [
    {name: "id", value: matched.id},
    { name: "modelId", value: parseInt(currentModelId) }, // 정수로 변환
    { name: "productName", value: matched.productName },
    { name: "modelName", value: matched.modelName },
    { name: "modelPrice", value: matched.modelPrice },
    { name: "modelDescription", value: matched.modelDescription },
    { name: "color", value: matched.color },
    { name: "ram", value: matched.ram },
    { name: "size", value: matched.size },
    { name: "optionalModelPrice", value: matched.optionalModelPrice }
  ];

  essentialFields.forEach(({ name, value }) => {
    const input = document.createElement("input");
    input.type = "hidden";
    input.name = name;
    input.value = value || '';
    form.appendChild(input);
  });

  document.body.appendChild(form);
  form.submit();
};




