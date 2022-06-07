// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "bootstrap"

import { priceSlider } from "../channels/price_slider";
import { myChart } from "../channels/graph";


document.addEventListener('turbolinks:load', () => {
  priceSlider();

  const optionMenu = document.querySelector(".select-menu"),
    selectBtn = optionMenu.querySelector(".select-btn"),
    options = optionMenu.querySelectorAll(".option"),
    sBtn_text = optionMenu.querySelector(".sBtn-text");

  selectBtn.addEventListener("click", () =>
    optionMenu.classList.toggle("active")
  );

  options.forEach((option) => {
    option.addEventListener("click", () => {
      let selectedOption = option.querySelector(".option-text").innerText;

      optionMenu.classList.remove("active");

      document.querySelector('.best-price .price').innerText = selectedOption.match(/\d*\$/)[0]
      document.querySelector('.information p strong').innerText = selectedOption.match(/US\d*.\d*/)
      document.querySelector('.market-btn') ? document.querySelector('.market-btn').remove() : null
    });
  });
})
