function price(){

  const priceInput = document.getElementById("item-price");
  const add_tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

    priceInput.addEventListener('input', () => {
        const value = priceInput.value;
        
      if (value >= 300 && value <= 9999999){
        let fee = Math.floor(value * 0.1)
        let gains = Math.floor(value - fee)
        add_tax.innerHTML = fee;
        profit.innerHTML = gains;
      } else {
        let fee = '';
        let gains = '';
        add_tax.innerHTML = fee;
        profit.innerHTML = gains;
      }
    });
}
window.addEventListener('load', price);