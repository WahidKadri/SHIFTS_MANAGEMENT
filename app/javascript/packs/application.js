import "bootstrap";
import $ from 'jquery';
import '../components/select2';
import '../components/flatpickr';
import { openMenu } from '../components/navmenu';
import { closeMenu } from '../components/navmenu';


// calendar

if (document.getElementById('calendar')){
  $(document).ready(showCalendar());
}

// navmenu
if (document.querySelector('.navbar')){
  openMenu();
  closeMenu();
}
