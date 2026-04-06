class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_many :posts
  has_many :assignedreqs
  has_many :requirements, through: :assignedreqs
end
