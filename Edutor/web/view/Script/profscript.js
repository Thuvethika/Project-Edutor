function displayProf() {
  console.log("Hello world");

  var popWindow6 = document.querySelector(".signup-form");
  var overlay6 = document.querySelector(".overlay6");

  popWindow6.classList.toggle("hidden");
  overlay6.classList.toggle("hidden");
}

document.getElementById("popWindow6").addEventListener("click", function () {
  displayProf();
});