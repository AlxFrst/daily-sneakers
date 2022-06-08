import { Controller } from "stimulus"
//import { value } from "../custom/graph"

export default class extends Controller {

  connect() {
    const value = document.querySelector('.cache').innerText
    const tabPrice = document.querySelectorAll('.table tbody tr :nth-child(2)')

    tabPrice.forEach((elt) => {
      if ((elt.innerText.slice(0, -1) - value) > 0) {
        elt.nextElementSibling.innerHTML = '<i style="color: red;" class="fa-solid fa-angle-up"></i>'
      } else if ((elt.innerText.slice(0, -1) - value) === 0) {
        elt.nextElementSibling.innerHTML = '<i class="fa-solid fa-equals"></i>'
      } else {
        elt.nextElementSibling.innerHTML = '<i style="color: green;" class="fa-solid fa-angle-down"></i>'
      }
    })
  }
}
