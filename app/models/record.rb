class Record < ActiveRecord::Base
  belongs_to :project
  belongs_to :secretary, class_name: "User"

  has_many :topics

  def number_of_topics
    topics.count
  end
end
