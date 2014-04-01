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

  private 
    def project_params
      params.require(:record).permit(:date, :secretary_id)
    end
end
