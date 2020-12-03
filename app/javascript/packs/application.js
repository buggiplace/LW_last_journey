// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
// require("trix")
require("@rails/actiontext")

// custom compontent imports
// require ("components/navbar-new")

// import 'mapbox-gl/dist/mapbox-gl.css';

// import { initMapbox } from '../plugins/init_mapbox';

// document.addEventListener('turbolinks:load', () => {
//   initMapbox();
// })


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initSelect2 } from '../components/init_select2';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';


//import { initChoices } from '../components/init_choices';
import { filterBurialType } from '../components/filter_burial_type';

import { initMapbox } from '../plugins/init_mapbox';
import "controllers"

// document view: js to show preview of a selected file to upload
const getFileName = () => {

  if(window.location.href.includes('documents')) {
    // funeral_document is the input that changes when a new file is selected
    document.getElementById('funeral_documents').onchange = function (e) {
      document.getElementById('preview-name').innerHTML = "File: " + e.target.files[0].name
    }
  }
}

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initChoices();
  initMapbox();
  filterBurialType();
  getFileName();
});

// import { previewImageOnFileSelect } from '../components/photo-preview.js';



// import { scrollFooter } from '../components/footer';

