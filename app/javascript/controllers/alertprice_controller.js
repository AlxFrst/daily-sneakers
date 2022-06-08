import { Controller } from "stimulus"

export default class extends Controller {

  addprice(event) {
    event.currentTarget.classList.toggle('d-none')
    document.querySelector('.add-price').classList.toggle('d-none')
    event.currentTarget.addEventListener('keypress', () => {
      if (e.key === 'Enter') {
        window.location.replace(`${window.location.href} + this.wishIdValue}`)
      }
    })
  }
}
