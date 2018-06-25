import "bootstrap";
import $ from 'jquery';
import '../components/select2';
import { modal } from '../components/modal';
import { openMenu } from '../components/navmenu';
import { closeMenu } from '../components/navmenu';


// calendar

if (document.getElementById('calendar')){
  $(document).ready(showCalendar());
}

if (document.querySelector('.photo-box')){
  modal();
}

// navmenu
if (document.querySelector('.navbar')){
  openMenu();
  closeMenu();
}
