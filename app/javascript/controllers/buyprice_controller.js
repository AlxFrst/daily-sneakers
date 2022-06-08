import { Controller } from "stimulus"

export default class extends Controller {

  addprice(event) {
    event.currentTarget.classList.toggle('d-none')
    document.querySelector('.add-price').classList.toggle('d-none')
  }
}
