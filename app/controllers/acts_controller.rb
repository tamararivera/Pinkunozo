class ActsController < ApplicationController
  before_action :signed_in_user
  def index
    @project = Project.find(params[:project_id])
    @records_grid = initialize_grid(Act.where(project_id: @project.id))
  end
  
  def new
    @project = Project.find(params[:project_id])
    @act = Act.new
  end

  def create
    @project = Project.find(params[:project_id])
    @project.acts.create(act_params)

    if @project.save
      flash[:success] = 'Acta grabada con éxito'
      redirect_to project_acts_url
    else
      render 'new'
    end
  end

  private 
    def act_params
      params.require(:act).permit(:date, :secretary_id, :attendants, topics_attributes: [:id, :name, :discussion, :_destroy])
    end
end
