class MilestonesController < ApplicationController
  before_action :signed_in_user
  
  def all
    @project = Project.find(params[:project_id])

    milestones = Milestone.joins(topic: :act).where('acts.id' => Act.where(project_id: @project.id).pluck(:id))
    @milestones_grid = initialize_grid(milestones,
      include: :user)
  end

  def agreements
    @project = Project.find(params[:project_id])

    milestones = Milestone.joins(topic: :act).where('acts.id' => Act.where(project_id: @project.id).pluck(:id))
    agreements = milestones.where(type_of_milestone: 'Acuerdo')

    @agreements_grid = initialize_grid(agreements,
      include: :user)
  end

  def reports
    @project = Project.find(params[:project_id])
    milestones = Milestone.joins(topic: :act).where('acts.id' => Act.where(project_id: @project.id).pluck(:id))

    @commitments = milestones.where(type_of_milestone: 'Compromiso')

    @attendants = Act.where(project_id: @project.id).joins(:attendants)

    @dates = {}
    @attendants.group(:date).count.map do |date, assistance|
      @dates[date.strftime('%m/%d/%y')] = assistance
    end

  end

  def show
    @project = Project.find(params[:project_id])
    @milestone = Milestone.find(params[:milestone_id])
  end
end 