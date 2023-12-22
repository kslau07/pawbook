import { Controller } from "@hotwired/stimulus";

// TODO: Clean up names, remove unnecessary forEach, abstract/extract classes
// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = [
    "content",
    // "content2",
    // "content3",
    "email",
    "username",
    "pets",
    "postCommentForm",
    "currentPassword",
  ];

  // TODO: Abstract away all other togglers except toggle()
  toggle() {
    let hiddenClass = "hidden";
    this.contentTargets.forEach((element) => {
      element.classList.toggle(hiddenClass);
    });
  }

  togglePostCommentForm() {
    // let hiddenClass = "hidden";
    // this.cTargets.forEach((element) => {
    //   element.classList.toggle(hiddenClass);
    // });

    let changeRows = "3";
    this.postCommentFormTargets.forEach((element) => {
      var rowSize = element.rows;
      if (rowSize == "1") {
        element.rows = changeRows;
      } else {
        element.rows = "1";
      }
    });
  }

  togglePets() {
    let hiddenClass = "hidden";
    this.petsTargets.forEach((element) => {
      element.classList.toggle(hiddenClass);
    });
  }

  toggleEmail() {
    let hiddenClass = "hidden";
    this.emailTargets.forEach((element) => {
      element.classList.toggle(hiddenClass);
    });
    this.currentPasswordTarget.classList.remove(hiddenClass);
  }

  toggleUsername() {
    let hiddenClass = "hidden";
    this.usernameTargets.forEach((element) => {
      element.classList.toggle(hiddenClass);
    });
    this.currentPasswordTarget.classList.remove(hiddenClass);
  }
}
