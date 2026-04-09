class AddPostToRequirements < ActiveRecord::Migration[8.1]
  def change
    add_reference :requirements, :post, null: false, foreign_key: true
  end
end
