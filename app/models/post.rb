class Post < ApplicationRecord
    belongs_to :organizer, class_name: "User", foreign_key: "organizer_id"
    has_many :requirements
    has_many :interestedevents, dependent: :destroy
    has_many :users, through: :interestedevents
    validates :event_title, :location, :event_date, presence: true
    validates :event_title, length: { maximum: 50 }
    accepts_nested_attributes_for :requirements, reject_if: :all_blank, allow_destroy: true
end
