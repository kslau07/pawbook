import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["content"];

  toggle() {
    let hiddenClass = "hidden";
    // this.contentTarget.classList.toggle(hiddenClass);
    this.contentTargets.forEach((element) => {
      element.classList.toggle(hiddenClass);
    });
  }
}
