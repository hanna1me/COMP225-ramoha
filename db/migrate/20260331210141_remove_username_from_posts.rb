class RemoveUsernameFromPosts < ActiveRecord::Migration[8.1]
  def change
    remove_column :posts, :username, :string
  end
end
