import { Controller } from "@hotwired/stimulus";

// TODO: Clean up names, remove unnecessary forEach, abstract/extract classes
// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [
    "content",
    // "content2",
    // "content3",
    "pets_name",
    "email",
    "username",
    "currentPassword",
  ];

  // TODO: Abstract away all other togglers except toggle()
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
