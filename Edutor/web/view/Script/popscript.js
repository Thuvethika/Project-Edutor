function displayManage() {
   
  
    var popWindow2 = document.querySelector(".manage-form");
    var overlay2 = document.querySelector(".overlay2");
  
    popWindow2.classList.toggle("hidden");
    overlay2.classList.toggle("hidden");
  }
  
  document.getElementById("popWindow2").addEventListener("click", function () {
    displayManage();
  });