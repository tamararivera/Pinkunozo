class Record < ActiveRecord::Base
  belongs_to :project
  belongs_to :secretary, class_name: "User"
end
