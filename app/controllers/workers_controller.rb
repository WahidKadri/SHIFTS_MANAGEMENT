class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update]
  before_action :set_upcase_data, only: [:update]

  def index
    if params[:query].present?
      sql_query = "details ILIKE :query"
      @workers = Worker.where(sql_query, query: "%#{params[:query]}%").order(details: :asc)
    else
      @workers = Worker.all.order(details: :asc)
    end
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
    @worker.details = "#{@worker.full_name} - #{@worker.status}"
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
      redirect_to workers_path
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
    @worker.details = "#{@worker.full_name} - #{@worker.status}"
  end
end
