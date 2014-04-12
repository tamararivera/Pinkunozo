class RecordsController < ApplicationController
  before_action :signed_in_user
  def index
    @project = Project.find(params[:project_id])
    @records_grid = initialize_grid(Record.where(project_id: @project.id))
  end
  
  def new
    @project = Project.find(params[:project_id])
    @record = Record.new
  end

  def create
    @project = Project.find(params[:project_id])
    @record = @project.records.new(record_params)
    @record.topics.build

    if @record.save
      flash[:success] = 'Acta grabada con éxito'
      redirect_to project_records_url
    else
      render 'new'
    end
  end

  private 
    def record_params
      params.require(:record).permit(:date, :secretary_id, :attendants, topics_attributes: [:id, :name, :discussion, :_destroy])
    end
end
