import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    console.log('Hello, Stimulus!');
    const tabPrices = document.querySelectorAll('.table tbody tr :nth-child(2)')

    tabPrices.forEach(elt => {
      if (elt.innerText !== undefined) {
        console.log(elt.innerText).slice(0, -1)
      }
    });
  }
}
