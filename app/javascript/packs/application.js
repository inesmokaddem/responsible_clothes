import "bootstrap";
import 'slick-carousel';
import 'slick-carousel/slick/slick.scss'

import '../components/select2';


$('.slider').slick({
  infinite: true,
  centerMode: true,
  slidesToShow: 1,
  slidesToScroll: 1,
  arrows: false
});
