class ShiftsController < ApplicationController
  before_action :set_shift, only: [:edit, :update]

  def new
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    @last_names = Worker.distinct.pluck(:last_name).sort.uniq
    # @shift.worker = @worker
    if @shift.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end


  private

  def shift_params
    params.require(:shift).permit(:start_date, :worker_id)
  end

  def set_shift
    @shift = Shift.find(params[:id])
  end
end
