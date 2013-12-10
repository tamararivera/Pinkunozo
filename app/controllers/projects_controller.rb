class ProjectsController < ApplicationController
  before_action :signed_in_user
  def show
    @project = Project.find(params[:id])
  end

  private 
    def project_params
      params.require(:project).permit(:name, :description)
    end
end