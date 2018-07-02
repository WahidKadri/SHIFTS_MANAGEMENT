class CalendarController < ApplicationController

  def index
    @shifts = Shift.all

    events = []
    @shifts.each do |shift|
      data = nil
      if shift.worker_id.nil?
        data = {
          title: "UNASSIGNED SHIFT",
          start: shift.start_date,
          allDay: true,
          backgroundColor: '#469AE0',
          textColor: 'black'
        }
        events << data
      elsif shift.worker.status == "MEDIC"
        data = {
          title: "#{shift.worker.full_name}",
          start: shift.start_date,
          allDay: true,
          backgroundColor: '#f1572b',
          borderColor: '#00A896',
          textColor: 'black'
        }
        events << data
      elsif shift.worker.status == "INTERN"
        data = {
          title: "#{shift.worker.full_name}",
          start: shift.start_date,
          allDay: true,
          backgroundColor: '#EBCC47',
          textColor: 'black'
        }
        events << data
      elsif shift.worker.status == "INTERIM"
        data = {
          title: "#{shift.worker.full_name}",
          start: shift.start_date,
          allDay: true,
          backgroundColor: '#32B796',
          borderColor: '#00A896',
          textColor: 'black'
        }
        events << data
      end
    end
    @events_week = events
    @events_month = events
  end
end
