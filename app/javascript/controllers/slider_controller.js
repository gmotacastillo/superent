import { Controller } from "@hotwired/stimulus"

import DoubleSlider from 'double-slider';
// Connects to data-controller="slider"
export default class extends Controller {
  static targets = ["minValue", "maxValue", "mySlider"]

  connect() {


    const mySlider = new DoubleSlider(this.mySliderTarget);
    mySlider.addEventListener('slider:input', () => {
      const {min, max} = mySlider.value;
      console.log(`Min is: ${min}, max is: ${max}`);
      this.minValueTarget.value = min
      this.maxValueTarget.value = max
    });

//     console.log("Hello")

// const rangeInput = document.querySelectorAll(".range-input input");
// const priceInput = document.querySelectorAll(".text-field-container input");
// const progress = document.querySelectorAll(".slider .progress");

// let priceGap = 1000;

// rangeInput.forEach(input =>{
//   input.addEventListener("input", e =>{
//     let minVal = parseInt(rangeInput[0].value),
//     maxVal = parseInt(rangeInput[1].value);

//     console.log(minVal,maxVal)
//     if(maxVal - minVal < priceGap){
//       if (e.target.className === "range-min") {
//         rangeInput[0].value  = maxVal - priceGap;
//       }else{
//         rangeInput[1].value  = minVal + priceGap;
//       }
//     }else{
//       priceInput[0].value = minVal;
//       priceInput[1].value = maxVal;
//       progress.style.left = (minVal / rangeInput[0].max) * 100 + "%";
//       progress.style.right = 100 - (maxVal / rangeInput[1].max) * 100 + "%";
//     }
//   });
// });
  }

  // change(event) {
  //   const value = event.currentTarget.value
  //   if (event.currentTarget.classList.contains("range-min")) {
  //     this.minValueTarget.value = value
  //   } else {
  //     this.maxValueTarget.value = value
  //   }

  //   if (this.maxValueTarget.value < (this.minValueTarget.value + 10)) {
  //     event.currentTarget.setAttribute('disabled', '')
  //   }
  // }

  // enable(event) {
  //   if (event.currentTarget.hasAttribute("disabled")) {
  //     event.currentTarget.removeAttribute("disabled")
  //   }
  // }
}
