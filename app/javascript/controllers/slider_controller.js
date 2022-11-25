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
  }
}
