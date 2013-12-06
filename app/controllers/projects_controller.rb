class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end

  private 
    def project_params
      params.require(:project).permit(:name, :description)
    end
end