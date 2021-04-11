
const tax_price = function() {
  const item_price = document.getElementById("item-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");


  item_price.addEventListener('keyup', function() {
    const tax = item_price.value * 0.1;
    const profit_price = item_price.value - tax;
    add_tax_price.innerHTML = tax;
    profit.innerHTML = profit_price;
  });
}

window.addEventListener("load", tax_price);