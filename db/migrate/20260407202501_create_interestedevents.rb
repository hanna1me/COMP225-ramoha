class CreateInterestedevents < ActiveRecord::Migration[8.1]
  def change
    create_table :interestedevents do |t|
      t.timestamps
    end
  end
end
