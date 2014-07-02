class Milestone < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  belongs_to :parent, class_name: "Milestone"
  has_many :childs, class_name: "Milestone", foreign_key: "parent_id"
end
