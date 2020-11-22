window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
if(inputValue >= 300 && inputValue < 9999999){
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
}else{
  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor();
}
})
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
if(inputValue >= 300 && inputValue < 9999999){
  const addTaxDom = document.getElementById("profit");
  addTaxDom.innerHTML = Math.floor(inputValue-(inputValue * 0.1));
}else{
  const addTaxDom = document.getElementById("profit");
  addTaxDom.innerHTML = Math.floor();
}
})
});