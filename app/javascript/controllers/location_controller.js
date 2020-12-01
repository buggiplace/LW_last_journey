import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "cityName", "cemetery" ];
  check(event) {
    event.preventDefault();
    this.cityNameTarget.value = this.cemeteryTarget.getElementsByClassName("location_name")[0].innerText
  }
}


// import { Controller } from "stimulus";
// export default class extends Controller {
//   static targets = [ 'cityName', 'cemetary' ];
//   check(event) {
//     this.cityNameTarget.value = this.cemetaryTarget.getElementsByClassName("location_name")[0].innerText
//   }
// }
