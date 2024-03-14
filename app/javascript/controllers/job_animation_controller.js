import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="job-animation"
export default class extends Controller {

  static targets = ["jobLeft", "jobRight", "divAnimate"]

  connect() {
    console.log("conectado ao job animation");
  }

  left() {
    this.divAnimateTarget.classList.add('animation-left')
  }

  right() {
    this.divAnimateTarget.classList.add('animation-right')
  }
}
