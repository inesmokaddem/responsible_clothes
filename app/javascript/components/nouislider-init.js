import 'nouislider/distribute/nouislider.css';
import noUiSlider from 'nouislider';

var slider = document.getElementById('slider');
const minInput = document.getElementById('search_price_min');
const maxInput = document.getElementById('search_price_max');

if (slider) {
  noUiSlider.create(slider, {
      start: [0, 500],
      connect: true,
      range: {
          'min': 0,
          'max': 1000
      }
  });

  slider.noUiSlider.on('end', function() {
    let values = slider.noUiSlider.get()
    let min = values[0]
    let max = values[1]

    minInput.value = min
    maxInput.value = max

    Rails.fire(minInput.form, 'submit')
  })
}
