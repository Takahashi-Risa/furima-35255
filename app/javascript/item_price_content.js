function calc () {
  const priceInput = document.getElementById("item-price")
  priceInput.addEventListener('input', function(){
    const inputValue =priceInput.value;
    const tax = 0.1;
    const tax_fee = inputValue * tax;
    const profit_fee = inputValue - tax_fee;
    const addTaxDom = document.getElementById("add-tax-price");
    const addProfitDom = document.getElementById("profit");
    addTaxDom.innerHTML = tax_fee;
    addProfitDom.innerHTML = profit_fee;
  })
}

window.addEventListener('load', calc)

