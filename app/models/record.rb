class Record < ActiveRecord::Base
  belongs_to :project
  belongs_to :secretary, class_name: "User"

  has_many :user_records, dependent: :destroy
  has_many :attendants, through: :user_records, source: :user
  has_many :topics

  def number_of_topics
    topics.count
  end
end
