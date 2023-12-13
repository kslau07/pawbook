import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["content", "pets_name", "email", "username", "currentPassword"];

  toggle() {
    let hiddenClass = "hidden";
    this.contentTargets.forEach((element) => {
      element.classList.toggle(hiddenClass);
    });
  }

  toggle_pets_name() {
    let hiddenClass = "hidden";
    this.pets_nameTargets.forEach((element) => {
      element.classList.toggle(hiddenClass);
    });
  }

  toggle_email() {
    let hiddenClass = "hidden";
    this.emailTargets.forEach((element) => {
      element.classList.toggle(hiddenClass);
    });

    this.currentPasswordTarget.classList.remove(hiddenClass);
  }

  toggle_username() {
    let hiddenClass = "hidden";
    this.usernameTargets.forEach((element) => {
      element.classList.toggle(hiddenClass);
    });
    this.currentPasswordTarget.classList.remove(hiddenClass);
  }
}
