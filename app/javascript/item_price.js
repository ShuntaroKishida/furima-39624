const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  const price = parseInt(inputValue, 10);
  const fee = Math.floor(price * 0.1);
  const profit = Math.floor(price - fee);
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit")
  addTaxDom.innerHTML = `${fee}`;
  profitDom.innerHTML = `${profit}`;
});