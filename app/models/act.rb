class Act < ActiveRecord::Base
  belongs_to :project
  belongs_to :secretary, class_name: 'User'

  has_many :user_acts
  has_many :attendants, through: :user_acts, source: :user

  has_many :topics
  accepts_nested_attributes_for :topics

end
