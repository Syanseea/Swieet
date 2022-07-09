class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.date :dating, null: false
      t.boolean :is_active, null: false, default: false

      t.timestamps
    end
  end
end
