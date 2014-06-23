class ActsController < ApplicationController
  before_action :signed_in_user
  def index
    @project = Project.find(params[:project_id])
    @acts_grid = initialize_grid(Act.where(project_id: @project.id),
      include: :secretary)
  end
  
  def show
    @project = Project.find(params[:project_id])
    actId = params[:id]
    desiredPage = params[:page]
    if (desiredPage.nil? || desiredPage.blank?)
      @act = Act.find(actId)
      actPage = Act.where(project_id: @project.id).order(:date).map(&:id).index(actId.to_f) + 1
      @acts = Act.where(project_id: @project.id).order(:date).page(actPage).per(1)
    else
      @act = Act.where(project_id: @project.id).order(:date)[desiredPage.to_f - 1]
      @acts = Act.where(project_id: @project.id).order(:date).page(desiredPage).per(1)
    end
  end 

  def modal
    @project = Project.find(params[:project_id])
    @milestones = Milestone.joins(topic: :act).where('acts.id' => Act.where(project_id: @project.id).pluck(:id))
  end

  def new
    @project = Project.find(params[:project_id])
    @act = Act.new
  end

  def create
    @project = Project.find(params[:project_id])
    @act = Act.create(act_params)

    if @project.acts<<@act
      flash[:success] = 'Acta creada con éxito'
      redirect_to project_acts_url
    else
      flash[:error] = 'El formulario contiene errores'
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    actId = params[:id]
    desiredPage = params[:page]
    if (desiredPage.nil? || desiredPage.blank?)
      @act = Act.find(actId)
      actPage = Act.where(project_id: @project.id).order(:date).map(&:id).index(actId.to_f) + 1
      @acts = Act.where(project_id: @project.id).order(:date).page(actPage).per(1)
    else
      @act = Act.where(project_id: @project.id).order(:date)[desiredPage.to_f - 1]
      @acts = Act.where(project_id: @project.id).order(:date).page(desiredPage).per(1)
    end
    
  end

  def update
    @project = Project.find(params[:project_id])
    actId = params[:id]
    desiredPage = params[:page]
    if (desiredPage.nil? || desiredPage.blank?)
      @act = Act.find(actId)
    else
      @act = Act.where(project_id: @project.id).order(:date)[desiredPage.to_f - 1]
    end

    if @act.update_attributes(act_params)
      flash[:success] = 'Acta actualizada con éxito'
      redirect_to project_acts_url
    else
      flash[:error] = 'El formulario contiene errores'
      render 'edit'
    end
  end

  private 
    def act_params
      params.require(:act).permit(:date, :secretary_id, attendant_ids: [],
                                  topics_attributes: [:id, :name, :discussion, :_destroy,
                                    milestones_attributes: [:id, :name, :description,
                                                          :user_id, :type_of_milestone, :status, :_destroy]])
    end
end
