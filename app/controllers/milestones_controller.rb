class MilestonesController < ApplicationController
  before_action :signed_in_user
  
  def all
    @project = Project.find(params[:project_id])

    milestones = Milestone.joins(topic: :act).where('acts.id' => Act.where(project_id: @project.id).pluck(:id))
    @milestones_grid = initialize_grid(milestones)
  end

  def agreements
    @project = Project.find(params[:project_id])

    milestones = Milestone.joins(topic: :act).where('acts.id' => Act.where(project_id: @project.id).pluck(:id))
    agreements = milestones.where(type_of_milestone: 'Acuerdo')

    @agreements_grid = initialize_grid(agreements)
  end
end 