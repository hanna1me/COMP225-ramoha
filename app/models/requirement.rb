class Requirement < ApplicationRecord
    belongs_to :post
    has_many :assignedreqs
    has_many :users, through: :assignedreqs
end
