function displayManage() {
   
  
    var popWindow3 = document.querySelector(".manage-form");
    var overlay3 = document.querySelector(".overlay3");
  
    popWindow3.classList.toggle("hidden");
    overlay3.classList.toggle("hidden");
  }
  
  document.getElementById("popWindow3").addEventListener("click", function () {
    displayManage();
  });