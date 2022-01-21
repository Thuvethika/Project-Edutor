function displayLINK() {
  var popWindow = document.querySelector(".link-form");
  var overlay = document.querySelector(".overlay");

  popWindow.classList.toggle("hidden");
  overlay.classList.toggle("hidden");
}

document.getElementById("popWindow").addEventListener("click", function () {
  displayLINK();
});

document.querySelector(".link-form").addEventListener("click", function () {
  event.stopPropagation();
});
