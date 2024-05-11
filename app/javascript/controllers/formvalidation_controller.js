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
      alert("Existem campos obrigatórios não preenchidos!."); // You can customize this message
    }
  }
}
