import $ from 'jquery';
import 'select2';

export default function applySelect2() {
  $('.select2').select2();
}

applySelect2();

// Requiring CSS! Path is relative to ./node_modules
import 'select2/dist/css/select2.css';
