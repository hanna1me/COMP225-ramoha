class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_many :posts
  has_one_attached :avatar
end
