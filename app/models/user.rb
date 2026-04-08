class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  has_many :organizedevents, class_name: 'Post', foreign_key: :organizer_id
  has_many :interestedevents
  has_many :posts, through: :interestedevents 

  has_many :assignedreqs
  has_many :requirements, through: :assignedreqs
end
