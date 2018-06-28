import 'fullcalendar';
import 'fullcalendar/dist/fullcalendar.css';

export function showCalendar() {

  $(function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
      // put your options and callbacks here
      themeSystem: 'bootstrap4',
      height: 450,
      dayClick: function(date) {
      $('#calendar').fullCalendar('changeView', 'agendaDay', date);
      event.preventDefault();
      // event.stopPropagation();
      },
      header: {
      left:   'month, agendaDay,',
      center: 'title',
      right:  'prev,next'
      }
    })
  });
}
