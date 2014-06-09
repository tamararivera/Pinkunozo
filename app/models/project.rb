class Project < ActiveRecord::Base
  has_many :user_projects, validate: false 
  has_many :participants, through: :user_projects, source: :user

  has_many :acts

  def add_user!(user)
    user_projects.create!(user_id: user.id)
  end
end
