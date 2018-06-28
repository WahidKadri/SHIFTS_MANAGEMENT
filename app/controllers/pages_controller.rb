class PagesController < ApplicationController
  def home
    @nil_shifts = Shift.where(worker_id: nil)
    @shifts = Shift.all.order(start_date: :asc)
  end

  def select
    @last_names = Worker.distinct.pluck(:last_name).sort.uniq
    @status = Worker.distinct.pluck(:status).sort
    @worker = Worker.new
  end

  def calendar
  end
end
