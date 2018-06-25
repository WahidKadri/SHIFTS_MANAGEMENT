class PagesController < ApplicationController
  def home
  end

  def select
    @last_names = Worker.distinct.pluck(:last_name).sort.uniq
    @status = Worker.distinct.pluck(:status).sort
    @worker = Worker.new
  end

  def calendar
  end
end
