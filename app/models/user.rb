class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  validates :username, length: { in: 1..20 }

  has_one_attached :avatar
  validate :avatar_content_type

  has_many :organizedevents, class_name: "Post", foreign_key: :organizer_id
  has_many :interestedevents
  has_many :posts, through: :interestedevents

  has_many :assignedreqs
  has_many :requirements, through: :assignedreqs

  private

  def avatar_content_type
    return unless avatar.attached?
    unless avatar.content_type.in?(%w[image/jpeg image/png])
      errors.add(:avatar, "must be a JPG or PNG file")
    end
  end
end
