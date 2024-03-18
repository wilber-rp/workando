import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="form-motion"
export default class extends Controller {
  connect() {
    const signUpButton = document.getElementById("signUp");
    const signInButton = document.getElementById("signIn");
    const container = document.getElementById("container");

    signUpButton.addEventListener("click", () => {
      container.classList.add("right-panel-active");
      // scrollIntoViewIfNeeded(document.querySelector(".sign-up-container"));
    });

    signInButton.addEventListener("click", () => {
      container.classList.remove("right-panel-active");
      // scrollIntoViewIfNeeded(document.querySelector(".sign-up-container"));
    });

    function scrollIntoViewIfNeeded(element) {
      const rect = element.getBoundingClientRect();
      const isInViewport = rect.top >= 0 && rect.left >= 0 && rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) && rect.right <= (window.innerWidth || document.documentElement.clientWidth);

      if (!isInViewport) {
        element.scrollIntoView({ behavior: "smooth", block: "center" });
      }
    }
  }
}
// const element = document.getElementById("sign-up-h1");

// const isInViewport = (element) => {
//   const rect = element.getBoundingClientRect();
//   const viewportHeight = window.innerHeight;
//   const position = rect.top / viewportHeight;
//   if (position >= 0 && position <= 1) {
//     return true;
//   } else {
//     return false;
//   }
// };
// console.log(isInViewport(element));
