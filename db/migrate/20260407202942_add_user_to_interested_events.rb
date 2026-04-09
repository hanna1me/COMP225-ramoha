class AddUserToInterestedEvents < ActiveRecord::Migration[8.1]
  def change
    add_reference :interestedevents, :user, null: false, foreign_key: true
  end
end
