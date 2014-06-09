class ProjectsController < ApplicationController
  before_action :signed_in_user
  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @project.participants << current_user
  end

  def create
    @project = Project.new(project_params)
    
    if @project.save
      flash[:success] = 'Proyecto grabado con éxito'
      redirect_to root_path
    else
      flash[:error] = 'El formulario contiene errores'
      render 'new'
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
    else
      flash[:error] = 'El formulario contiene errores'
      render 'edit'
    end
  end
  private 
    def project_params
      params.require(:project).permit(:name, :description, participant_ids: [])
    end
end