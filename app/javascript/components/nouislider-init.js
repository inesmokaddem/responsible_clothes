import 'nouislider/distribute/nouislider.css';
import noUiSlider from 'nouislider';
import wNumb from 'wnumb';

var slider = document.getElementById('slider');
const minInput = document.getElementById('search_price_min');
const maxInput = document.getElementById('search_price_max');

if (slider) {
  noUiSlider.create(slider, {
      start: [0, 20],
      connect: true,
      range: {
          'min': 0,
          'max': 200
      },
      pips: {
          mode: 'positions',
          values: [0, 25, 50, 75, 100],
          density: 4,
          format: wNumb({
            decimals: 2,
            prefix: '€'
        })
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
