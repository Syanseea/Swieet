class CreateThemes < ActiveRecord::Migration[6.1]
  def change
    create_table :themes do |t|
      t.integer :menu_id, null: false
      t.string :style, null: false

      t.timestamps
    end
  end
end
