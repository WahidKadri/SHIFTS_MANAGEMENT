class PagesController < ApplicationController
  def home
    @nil_shifts = Shift.where(worker_id: nil)
    @shifts = Shift.all.order(start_date: :asc)
  end

  def select_worker
    @details = Worker.distinct.pluck(:details).sort.uniq
    @worker = Worker.new
    @workers = Worker.where(details: params[:worker][:details]) if (params[:worker].present? && params[:worker][:details].present?)
  end

  def select_shift
    @workers = Worker.distinct.pluck(:details).sort.uniq
    @shift = Shift.new
  end
end
