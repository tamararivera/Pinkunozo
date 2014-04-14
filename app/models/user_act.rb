class UserAct < ActiveRecord::Base
  belongs_to :user
  belongs_to :act

  validates :user_id, presence: true
  validates :act_id, presence: true
end