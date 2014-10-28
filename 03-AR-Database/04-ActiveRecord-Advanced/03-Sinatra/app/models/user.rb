class User < ActiveRecord::Base
  has_many :posts

  # TODO: Add some validation
  validates :username, :email, presence: true
  validates :username, uniqueness: true
  validates :email, format: { with: /\A.*@.*\..*\z/, message: "invalid email" }
  before_validation :remove_blanks


  private

  def remove_blanks
    self.email = self.email.nil? ? self.email : self.email.strip
  end
end