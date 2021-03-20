class User < ApplicationRecord
  has_many :topics
  has_many :messages
  

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { within: 6..50 }

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # def self.authenticate(name, submitted_password)
  #    user = find_by_name(name)
  #    return nil  if user.nil?
  #    return user if user.password == submitted_password
  # end

end
