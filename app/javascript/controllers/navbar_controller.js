import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  updateNavbar() {
    if (document.body.scrollTop >= 80 || document.documentElement.scrollTop >= 80) {
      this.element.classList.add("navbar-lewagon-white")
    } else {
      this.element.classList.remove("navbar-lewagon-white")
    }
  };
}
