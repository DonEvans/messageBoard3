class Topic < ApplicationRecord
  has_many :messages
  belongs_to :user

  validates :title, presence:true, length: {maximum:30}
  validates :user_id, presence:true
  
end
