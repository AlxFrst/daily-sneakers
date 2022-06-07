import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    console.log('Hello, Stimulus!');
    const tabPrice = document.querySelector('.table tbody tr :nth-child(2)')


  }
}
