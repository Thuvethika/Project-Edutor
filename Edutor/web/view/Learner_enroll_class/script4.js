function displaySTAR() {
  var popWindow2 = document.querySelector(".rating-form");
  var overlay2 = document.querySelector(".overlay2");

  popWindow2.classList.toggle("hidden");
  overlay2.classList.toggle("hidden");
}

document.getElementById("popWindow2").addEventListener("click", function () {
  displaySTAR();
});

document.querySelector(".rating-form").addEventListener("click", function () {
  event.stopPropagation();
});
