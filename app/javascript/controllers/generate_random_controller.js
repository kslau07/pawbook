import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="generate-random"
export default class extends Controller {
  static targets = ["content"];

  genHexString() {
    const len = 30;
    const hex = "0123456789abcdef";
    let output = "";
    for (let i = 0; i < len; ++i) {
      output += hex.charAt(Math.floor(Math.random() * hex.length));
    }
    this.contentTarget.value = output;
  }

  copy() {
    navigator.clipboard.writeText(this.contentTarget.value)
  }
}
