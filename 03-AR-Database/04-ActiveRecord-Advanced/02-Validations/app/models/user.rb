class User < ActiveRecord::Base
  has_many :posts
  # TODO: Add some validation
  validates :username, :email, presence: true
  validates :username, uniqueness: true
  validates :email, format: { with: /\A.*@.*\..*\z/ }
end