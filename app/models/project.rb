class Project < ActiveRecord::Base
  has_many :user_projects, validate: false 
  has_many :participants, through: :user_projects, source: :user

  has_many :acts

  validates :name, :description, presence: true


  def add_user!(user)
    user_projects.create!(user_id: user.id)
  end
end
