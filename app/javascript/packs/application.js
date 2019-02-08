import "bootstrap";
import 'slick-carousel';
import 'slick-carousel/slick/slick.scss'

import '../components/select2';
import '../components/nouislider-init';
import '../components/stars_selection';
import '../components/add_composition';



$('.slider').slick({
  infinite: true,
  centerMode: true,
  slidesToShow: 1,
  slidesToScroll: 1,
  arrows: false
});
