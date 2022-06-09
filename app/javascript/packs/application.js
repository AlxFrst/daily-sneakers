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
import { keyHandler } from "../channels/rickandmorty";


document.addEventListener('turbolinks:load', () => {
  priceSlider();

  if (document.querySelector(".select-menu")) {
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
        const url = window.location.href.match(/([\w|\:|\/\.]*)/)[1]
        window.location.replace(`${url}?size=${selectedOption.match(/\d*\.\d*/)}`)
      });
    });
  }
})

document.addEventListener('keydown', keyHandler, false);
