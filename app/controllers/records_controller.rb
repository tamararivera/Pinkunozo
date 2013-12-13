class RecordsController < ApplicationController
  def index
    @project = Project.find(params[:id])
    @records = @project.records
  end
end
