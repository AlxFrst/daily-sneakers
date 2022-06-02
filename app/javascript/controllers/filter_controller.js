import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "content" ]

  connect() {
    console.log('Hello, Stimulus!');
  }

  revealContent() {
    if (this.contentTarget.style.display == "none") {
      this.contentTarget.style.display = "block";
    } else {
      this.contentTarget.style.display = "none";
    }
  }
}
