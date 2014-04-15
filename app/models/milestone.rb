class Milestone < ActiveRecord::Base
  belongs_to :act
  belongs_to :user
end
