class AddUserRefToAssignedreqs < ActiveRecord::Migration[8.1]
  def change
    add_reference :assignedreqs, :user, null: false, foreign_key: true
  end
end
