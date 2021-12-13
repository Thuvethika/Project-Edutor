var servicesBtn = document.getElementById("services");
var industriesBtn = document.getElementById("industries");
var specializedBtn = document.getElementById("specialized");

var servicesContainer = document.getElementById("servicesContainer");
var industriesContainer = document.getElementById("industriesContainer");
var specializedContainer = document.getElementById("specializedContainer");

servicesBtn.addEventListener("click", function () {
  industriesContainer.style.opacity = "0";
  specializedContainer.style.opacity = "0";

  setTimeout(hideCtn2, 500);

  function hideCtn2() {
    industriesContainer.classList.add("hidden");
    specializedContainer.classList.add("hidden");
    setTimeout(viewCtn1, 100);
    servicesContainer.classList.remove("hidden");
  }
  function viewCtn1() {
    servicesContainer.style.opacity = "1";
  }

  servicesBtn.classList.add("add-underline");
  industriesBtn.classList.remove("add-underline");
  specializedBtn.classList.remove("add-underline");
});
industriesBtn.addEventListener("click", function () {
  servicesContainer.style.opacity = "0";
  industriesContainer.style.opacity = "0";
  specializedContainer.style.opacity = "0";

  setTimeout(hideCtn1, 500);

  function hideCtn1() {
    servicesContainer.classList.add("hidden");
    industriesContainer.classList.remove("hidden");
    setTimeout(viewCtn2, 100);
    specializedContainer.classList.add("hidden");
  }
  function viewCtn2() {
    industriesContainer.style.opacity = "1";
  }

  servicesBtn.classList.remove("add-underline");
  industriesBtn.classList.add("add-underline");
  specializedBtn.classList.remove("add-underline");
});
specializedBtn.addEventListener("click", function () {
  servicesContainer.style.opacity = "0";
  industriesContainer.style.opacity = "0";

  setTimeout(hideCtn3, 500);
  function hideCtn3() {
    servicesContainer.classList.add("hidden");
    industriesContainer.classList.add("hidden");
    setTimeout(viewCtn3, 100);
    specializedContainer.classList.remove("hidden");
  }
  function viewCtn3() {
    specializedContainer.style.opacity = "1";
  }
  servicesBtn.classList.remove("add-underline");
  industriesBtn.classList.remove("add-underline");
  specializedBtn.classList.add("add-underline");
});
