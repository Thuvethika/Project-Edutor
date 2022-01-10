'use strict'
function displayRating() {
    console.log("Hello world");
  
    var popWindow = document.querySelector(".rating-form");
    var overlay = document.querySelector(".overlay");
  
    popWindow.classList.toggle("hidden");
    overlay.classList.toggle("hidden");
  }
  
  document.getElementById("popWindow").addEventListener("click", function () {
    displaySignup();
  });