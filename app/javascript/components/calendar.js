import 'fullcalendar';
import 'fullcalendar/dist/fullcalendar.css';

export function showCalendar() {

  const listEventsWeek = JSON.parse(document.getElementById('calendar').dataset.eventWeek);
  const listEventsMonth = JSON.parse(document.getElementById('calendar').dataset.eventMonth);

  $(function() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
      // put your options and callbacks here
      themeSystem: 'bootstrap4',
      height: 400,
      defaultView: 'agendaWeek',
      header: {
      left:   'agendaWeek, month,',
      center: 'title',
      right:  'prev,next'
      },
      events: listEventsWeek,
      eventLimit: 3,
      // editable: true,
      // eventDrop: function(event, delta, revertFunc) {

      //     alert(event.title + " was dropped on " + event.start.format());

      //     if (!confirm("Are you sure about this change?")) {
      //       revertFunc();
      //     }

      //     $('#calendar').fullCalendar('updateEvent', event);
      //   },
      viewRender: function(view, element) {
        if (view.type === 'agendaWeek'){
          $('#calendar').fullCalendar('removeEvents');
          $('#calendar').fullCalendar('renderEvents', listEventsWeek);
        }
      },
      events: listEventsMonth,
      viewRender: function(view, element) {
        if (view.type === 'month'){
          $('#calendar').fullCalendar('removeEvents');
          $('#calendar').fullCalendar('renderEvents', listEventsMonth);
        }
      },
    })
  });
}
