class AddDetailsToPosts < ActiveRecord::Migration[8.1]
  def change
    add_column :posts, :username, :string
    add_column :posts, :event_title, :string
    add_column :posts, :location, :string
    add_column :posts, :event_date, :date
    add_column :posts, :description, :string
  end
end
