import 'fullcalendar';
import 'fullcalendar/dist/fullcalendar.css';

export function showCalendar() {

  const listEventsDay = JSON.parse(document.getElementById('calendar').dataset.eventDay);
  const listEventsWeek = JSON.parse(document.getElementById('calendar').dataset.eventWeek);
  // listEventsMonth.forEach(function(element) {
  //   console.log(element);
  // });

  $(function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
      // put your options and callbacks here
      themeSystem: 'bootstrap4',
      height: 400,
      defaultView: 'agendaWeek',
      dayClick: function(date) {
      $('#calendar').fullCalendar('changeView', 'agendaDay', date);
      event.preventDefault();
      // event.stopPropagation();
      },
      header: {
      left:   'agendaWeek, agendaDay,',
      center: 'title',
      right:  'prev,next'
      },
      events: listEventsWeek,
      eventRender: function(event, element) {
        content: event.description;
      },
      viewRender: function(view, element) {
        if (view.type === 'agendaDay'){
          $('#calendar').fullCalendar('removeEvents');
          $('#calendar').fullCalendar('renderEvents', listEventsDay);
        }
        if (view.type === 'month'){
          $('#calendar').fullCalendar('removeEvents');
          $('#calendar').fullCalendar('renderEvents', listEventsWeek);
        }
      }
    })
  });
}
