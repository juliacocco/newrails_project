//= require rails-ujs
//= require_tree .

function addUnits() {
  const plus_button = document.getElementById("plus_button");
  plus_button.addEventListener("click", (event) => {
    console.log(event.currentTarget);
  });
}

function lessUnits() {
  const minus_button = document.getElementById("minus_button");
  minus_button.addEventListener("click", (event) => {
    console.log(event.currentTarget);
  });
}
