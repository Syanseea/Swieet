class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.integer :theme_id, null: false
      t.integer :meter, null: false
      t.integer :repeat, null: false
      t.integer :set, null: false
      t.integer :second, null: false
      t.text :detail

      t.timestamps
    end
  end
end
