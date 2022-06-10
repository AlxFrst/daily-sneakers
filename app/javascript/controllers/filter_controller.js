import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "content" ]

  connect() {
  }

  revealContent() {
    this.contentTarget.classList.toggle('d-none');
  }

  selectOption(event) {
    event.target.classList.toggle("active");
  }

  submitFilter() {
    let brands = [];
    document.querySelectorAll(".index-filter-brands span").forEach(elt => {
      elt.classList.contains('active') ? brands.push(elt.innerText) : console.log('ok');
    });
    let sellers = [];
    document.querySelectorAll(".index-filter-sellers span").forEach(elt => {
      elt.classList.contains('active') ? sellers.push(elt.innerText) : console.log('ok');
    });
    const min = document.querySelectorAll('.range-slider input')[0].value
    const max = document.querySelectorAll('.range-slider input')[1].value
    window.location.href = `/sneakers?brands=${brands.toString()}&sellers=${sellers.toString()}&min=${min}&max=${max}`;
  }

  deletePrice() {
    const url = window.location.href.replace(/\min=\d*&max=\d*/, 'min=0&max=10000')
    window.location.replace(url)
  }

  deleteBrand(event) {
    const brand = `\\,*${event.currentTarget.innerText.replace(' ', '%20')}`
    const regex = new RegExp(brand, 'i')
    const url = window.location.href.replace(regex, '')
    window.location.replace(url)
  }

  deleteSeller(event) {
    const seller = `\\,*${event.currentTarget.innerText}`
    const regex = new RegExp(seller, 'i')
    const url = window.location.href.replace(regex, '')
    window.location.replace(url)
  }
}
