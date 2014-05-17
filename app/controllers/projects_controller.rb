class ProjectsController < ApplicationController
  before_action :signed_in_user
  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @project.users << current_user
  end

  def create
    @project = Project.new(project_params)

    if @project.save

      users = User.find(params[:project][:user_ids].reject(&:empty?))
      @project.users << users

      flash[:success] = 'Proyecto grabado con éxito'
      redirect_to root_path
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = 'Proyecto grabado con éxito'
      redirect_to root_path
    end
  end
  private 
    def project_params
      params.require(:project).permit(:name, :description)
    end
end