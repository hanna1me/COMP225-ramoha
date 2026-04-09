class RemoveUserFromPosts < ActiveRecord::Migration[8.1]
  def change
    remove_reference :posts, :user, null: false, foreign_key: true
  end
end
