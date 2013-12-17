class RecordsController < ApplicationController
  def index
    @project = Project.find(params[:id])
    @records_grid = initialize_grid(Record.where(project_id: params[:id]))
  end
end
