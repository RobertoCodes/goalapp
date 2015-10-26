class Goal < ActiveRecord::Base

  validates :name, :user_id, presence: true

  belongs_to :user

  has_many :comments,
    class_name: "GoalComment",
    foreign_key: :goal_id,
    primary_key: :id


end
