class Post < ApplicationRecord
    belongs_to :organizer, class_name: 'User', foreign_key: "organizer_id"
    has_many :requirements

    has_many :interestedevents
    has_many :users, through: :interestedevents 
end
