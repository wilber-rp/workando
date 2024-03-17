import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="formvalidation"
export default class extends Controller {
  initialize() {
    this.element.addEventListener("submit", this.validateForm.bind(this));
  }

  validateForm(event) {
    const requiredInputs = this.element.querySelectorAll("input[required]");
    let isEmpty = false;

    requiredInputs.forEach((input) => {
      if (input.value.trim() === "") {
        isEmpty = true;
      }
    });

    if (isEmpty) {
      event.preventDefault(); // Prevent form submission
      alert("Todos os campos precisam ser preenchidos!."); // You can customize this message
    }
  }
}

// import { Controller } from "@hotwired/stimulus";

// // Connects to data-controller="formvalidation"
// export default class extends Controller {
//   initialize() {
//     this.element.addEventListener("submit", this.validateForm.bind(this));
//   }

//   validateForm(event) {
//     const passwordInput = this.element.querySelector("input[name='password']");
//     const confirmPasswordInput = this.element.querySelector("input[name='confirm_password']");
//     const requiredInputs = this.element.querySelectorAll("input[required]");
//     let isEmpty = false;
//     let passwordsMatch = true;

//     requiredInputs.forEach((input) => {
//       if (input.value.trim() === "") {
//         isEmpty = true;
//       }
//     });

//     if (!passwordInput || !confirmPasswordInput) {
//       // Password fields not found, cannot perform validation
//       return;
//     }

//     if (passwordInput.value !== confirmPasswordInput.value) {
//       passwordsMatch = false;
//     }

//     if (isEmpty || !passwordsMatch) {
//       event.preventDefault(); // Prevent form submission
//       if (!passwordsMatch) {
//         alert("A confirmação da senha não coincide com a senha digitada.");
//       } else {
//         alert("Todos os campos precisam ser preenchidos!");
//       }
//     }
//   }
// }
