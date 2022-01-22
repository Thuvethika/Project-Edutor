function displayDiscuss() {
   
  
    var popWindow3 = document.querySelector(".classform");
    var overlay3 = document.querySelector(".overlay3");
  
    popWindow3.classList.toggle("hidden");
    overlay3.classList.toggle("hidden");
  }
  
  document.getElementById("popWindow3").addEventListener("click", function () {
    displayDiscuss();
  });


