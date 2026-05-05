class Assignedreq < ApplicationRecord
    #This is for once we implement users signing up for requirements. For now, it is unused.
    belongs_to :requirement
    belongs_to :user
end
