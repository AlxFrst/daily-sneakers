import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  updateNavbar() {
    if (document.body.scrollTop >= 10 || document.documentElement.scrollTop >= 10) {
      this.element.classList.add("navbar-lewagon-white")
    } else {
      this.element.classList.remove("navbar-lewagon-white")
    }
  };
}