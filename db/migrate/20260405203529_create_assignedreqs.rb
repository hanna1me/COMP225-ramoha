class CreateAssignedreqs < ActiveRecord::Migration[8.1]
  def change
    create_table :assignedreqs do |t|
      t.timestamps
    end
  end
end
