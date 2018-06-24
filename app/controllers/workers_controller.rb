class WorkersController < ApplicationController

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])
    if @worker.update(worker_params)
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def worker_params
    params.require(:worker).permit(:first_name, :status)
  end
end
