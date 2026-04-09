class AddOrganizerToPosts < ActiveRecord::Migration[8.1]
  def change
    add_reference :posts, :organizer, null: false, foreign_key: {to_table: :users}
  end
end
