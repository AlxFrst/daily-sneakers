import { Controller } from "@hotwired/stimulus"
import { Application } from 'stimulus'
import Chart from 'stimulus-chartjs'

const application = Application.start()
application.register('chart', Chart)

export default class extends Controller {
    connect() {
        const data = {
            labels: labels,
            datasets: [{
              backgroundColor: 'rgb(255, 99, 132)',
              borderColor: 'rgb(255, 99, 132)',
              data: [value6, value5, value4, value3, value2, value, price],
            }]
          };
    }

}
