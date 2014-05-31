class Topic < ActiveRecord::Base
  belongs_to :act
  
  has_many :milestones
  accepts_nested_attributes_for :milestones
end
