function calculation (){
  const price  = document.getElementById("item-price");
  price.addEventListener("keyup", () => {
    feeCalculation = Math.round(price.value * 0.1);
    const salesCommission  = document.getElementById("add-tax-price");
    salesCommission.innerHTML = `${feeCalculation}`;
    profitCalculation = price.value - feeCalculation;
    const salesProfit  = document.getElementById("profit");
    salesProfit.innerHTML = `${profitCalculation}`;
  });
 };
 
 window.addEventListener('load', calculation);