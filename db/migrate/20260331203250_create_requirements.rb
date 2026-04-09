class CreateRequirements < ActiveRecord::Migration[8.1]
  def change
    create_table :requirements do |t|
      t.string :req_description

      t.timestamps
    end
  end
end
