const stars = document.querySelectorAll(".star.rating")
const starsContainer = document.querySelector(".stars")
const input = document.getElementById("stars")

if (stars) {
  stars.forEach( star =>
    star.addEventListener('click', function() {
      input.value = this.dataset.rating;
      starsContainer.dataset.stars = this.dataset.rating;
    })
  )
}
