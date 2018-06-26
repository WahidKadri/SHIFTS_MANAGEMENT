class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update]
  before_action :set_upcase_data, only: [:update]

  def index
    @workers = Worker.all.order(status: :desc).order(last_name: :asc)
    @workers = Worker.where(last_name: params[:worker][:last_name]) if (params[:worker].present? && params[:worker][:last_name].present?)
    @workers = Worker.where(status: params[:worker][:status]) if (params[:worker].present? && params[:worker][:status].present?)

    @medics = Worker.where(status: "MEDIC").order(last_name: :asc).order(first_name: :asc)
    @interns = Worker.where(status: "INTERN").order(last_name: :asc).order(first_name: :asc)
    @interims = Worker.where(status: "INTERIM").order(last_name: :asc).order(first_name: :asc)
  end

  def show
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    @worker.first_name = params[:worker][:first_name].capitalize
    @worker.last_name = params[:worker][:last_name].upcase
    @worker.full_name = "#{@worker.first_name} #{@worker.last_name}"
    @worker.status = params[:worker][:status].upcase
    if @worker.save
      redirect_to worker_path(@worker)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @worker.update(worker_params)
      redirect_to worker_path(@worker)
    else
      render :new
    end
  end


  private

  def worker_params
    params.require(:worker).permit(:first_name.capitalize, :last_name.upcase, :status.upcase)
  end

  def set_worker
    @worker = Worker.find(params[:id])
  end

  def set_upcase_data
    @worker.first_name = params[:worker][:first_name].capitalize
    @worker.last_name = params[:worker][:last_name].upcase
    @worker.full_name = "#{@worker.first_name} #{@worker.last_name}"
    @worker.status = params[:worker][:status].upcase
  end
end
