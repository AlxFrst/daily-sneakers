import { Controller } from "stimulus"
//import { value } from "../custom/graph"

export default class extends Controller {
  static values = {
    data: String
  }

  connect() {
    console.log("market controller connected")
    const value = document.querySelector('canvas').attributes['data-chart-data-value'].value.match(/"data": \[(.*?)\]/)[1].split(',')
    const lastValue = value[value.length - 2]
    console.log(lastValue)
    const tabPrice = document.querySelectorAll('.table tbody tr :nth-child(2)')

    tabPrice.forEach((elt) => {
      if ((elt.innerText.slice(0, -1) - lastValue) > 0) {
        elt.nextElementSibling.innerHTML = '<i style="color: red;" class="fa-solid fa-angle-up"></i>'
      } else if ((elt.innerText.slice(0, -1) - lastValue) === 0) {
        elt.nextElementSibling.innerHTML = '<i class="fa-solid fa-equals"></i>'
      } else {
        elt.nextElementSibling.innerHTML = '<i style="color: green;" class="fa-solid fa-angle-down"></i>'
      }
    })
  }
}

// create a regex to match all data in the array like "data": [208, 237, 249, 260, 246, 240]
// const regex = /data: \[(.*?)\]/g


