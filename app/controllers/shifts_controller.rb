class ShiftsController < ApplicationController

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


  private

  def shift_params
    params.require(:shift).permit(:start_date)
  end
end
