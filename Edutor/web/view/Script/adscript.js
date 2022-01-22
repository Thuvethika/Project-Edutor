


  function displayAd() {
    console.log("Hello world");
  
    var popWindow = document.querySelector(".ad-form");
    var overlay = document.querySelector(".overlay");
  
    popWindow.classList.toggle("hidden");
    overlay.classList.toggle("hidden");
  }
  
  document.getElementById("popWindow").addEventListener("click", function () {
    displayAd();
  });

  

