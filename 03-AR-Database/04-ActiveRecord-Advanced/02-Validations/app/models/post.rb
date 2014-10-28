class Post < ActiveRecord::Base
  belongs_to :user
  # TODO: Add some validation
  validates :user, :name, :url, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :name, length: { minimum: 5 }
  validates :url, format: { with: /\A.*\..*\z/ }
end