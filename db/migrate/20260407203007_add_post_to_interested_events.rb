class AddPostToInterestedEvents < ActiveRecord::Migration[8.1]
  def change
    add_reference :interestedevents, :post, null: false, foreign_key: true
  end
end
