const buttons = document.querySelectorAll('.menu-card button');
buttons.forEach(btn => {
  btn.addEventListener('click', () => {
    console.log("Order submitted.");
  });
});