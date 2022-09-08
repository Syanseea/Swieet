// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"

import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'
import "../menus/print"
// require("jquery")
require("@nathanvda/cocoon")


Rails.start()

ActiveStorage.start()

const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

// copy-btn
//本番環境ではクリップボードというワードが使えなかった
$(document).ready(function(){
   $(".copy-btn").click(function() {
  var url = $(location).attr('href');
  var copyTextarea = document.createElement("textarea");
  copyTextarea.style.position = "fixed";
  copyTextarea.style.opacity = "0";
  copyTextarea.textContent = url;
  document.body.appendChild(copyTextarea);
  copyTextarea.select();
  document.execCommand("copy");
  document.body.removeChild(copyTextarea);
  //navigator.clipboard.writeText(url);

  //alert("コピーできました！");
  $("#copy-element").append('<p>コピーが完了しました</p>')
})
})

