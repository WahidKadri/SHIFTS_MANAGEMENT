class ShiftsController < ApplicationController
  before_action :set_shift, only: [:edit, :update]

  def index
    if params[:query].present?
      sql_query = "start_date = :query"
      @shifts = Shift.where(sql_query, query: "%#{params[:query]}%").order(start_date: :asc)
    else
      @shifts = Shift.all.order(start_date: :asc)
    end
  end

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    if @shift.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @shift.update(shift_params)
      redirect_to calendar_index_path
    else
      render :new
    end
  end


  private

  def shift_params
    params.require(:shift).permit(:start_date, :worker_id)
  end

  def set_shift
    @shift = Shift.find(params[:id])
  end
end
