class Goal < ActiveRecord::Base
  
  validates :name, :user_id, presence: true

  belongs_to :user

end