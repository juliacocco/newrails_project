export default function ()  {
  document.addEventListener("DOMContentLoaded", function() {
    const categoryFilterList = document.querySelectorAll('.categoryfilter');

    for ( const category of categoryFilterList) {
      category.addEventListener('click', function(e)  {
        const cards = document.querySelectorAll(".card");
        for ( const card of cards) {
          const cardCategory = card.dataset.category;
          if (cardCategory === category.innerText) {
            card.style.display = "";
          } else {
            card.style.display = "none";
          }
        }
      });
    }
  });
}
