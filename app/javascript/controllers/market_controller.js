import { Controller } from "stimulus"
import { value } from "../channels/graph"

export default class extends Controller {

  connect() {
    console.log('Hello, Stimulus!');
    const tabPrice = document.querySelector('.table tbody tr :nth-child(2)')

    console.log(tabPrice.innerText.slice(0, -1) - value);
    if ((tabPrice.innerText.slice(0, -1) - value) > 0) {
      document.querySelector('.table tbody tr :nth-child(3)').innerHTML = '<i style="color: red;" class="fa-solid fa-angle-up"></i>'
    } else if ((tabPrice.innerText.slice(0, -1) - value) === 0) {
      document.querySelector('.table tbody tr :nth-child(3)').innerHTML = '<i class="fa-solid fa-equals"></i>'
    } else {
      document.querySelector('.table tbody tr :nth-child(3)').innerHTML = '<i style="color: green;" class="fa-solid fa-angle-down"></i>'
    }
  }
}
