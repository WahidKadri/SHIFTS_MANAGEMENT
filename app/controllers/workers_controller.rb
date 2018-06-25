class WorkersController < ApplicationController

  def index
    @workers = Worker.all.order(status: :desc).order(last_name: :asc)
    @workers = Worker.where(last_name: params[:worker][:last_name]) if (params[:worker].present? && params[:worker][:last_name].present?)
    @workers = Worker.where(status: params[:worker][:status]) if (params[:worker].present? && params[:worker][:status].present?)

    @medics = Worker.where(status: "MEDIC").order(last_name: :asc).order(first_name: :asc)
    @interns = Worker.where(status: "INTERN").order(last_name: :asc).order(first_name: :asc)
    @interims = Worker.where(status: "INTERIM").order(last_name: :asc).order(first_name: :asc)
  end

  def show
    @worker = Worker.find(params[:id])
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    @worker.first_name = params[:worker][:first_name].capitalize
    @worker.last_name = params[:worker][:last_name].upcase
    @worker.status = params[:worker][:status].upcase
    if @worker.save
      redirect_to worker_path(@worker)
    else
      render :new
    end
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])
    @worker.first_name = params[:worker][:first_name].capitalize
    @worker.last_name = params[:worker][:last_name].upcase
    @worker.status = params[:worker][:status].upcase
    if @worker.update(worker_params)
      redirect_to worker_path(@worker)
    else
      render :new
    end
  end


  private

  def worker_params
    params.require(:worker).permit(:first_name, :last_name, :status)
  end
end
