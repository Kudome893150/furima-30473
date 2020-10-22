window.addEventListener('load', function(){
  const price = document.getElementById("item-price")
  price.addEventListener("keyup", function(){
    
      let amount = price.value;
      let add_tax = Math.ceil(amount * 0.1);
      let profit = Math.floor(amount - add_tax);
      document.getElementById('add-tax-price').innerHTML = add_tax;
      document.getElementById('profit').innerHTML = profit;
    });
   })