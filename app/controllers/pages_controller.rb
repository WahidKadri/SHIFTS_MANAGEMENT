class PagesController < ApplicationController

  def home
    @nil_shifts = Shift.where(worker_id: nil)
    @shifts = Shift.all.order(start_date: :asc)
  end
end
