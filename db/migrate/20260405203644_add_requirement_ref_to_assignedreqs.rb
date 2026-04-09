class AddRequirementRefToAssignedreqs < ActiveRecord::Migration[8.1]
  def change
    add_reference :assignedreqs, :requirement, null: false, foreign_key: true
  end
end
