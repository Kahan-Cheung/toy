class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :introduce
      t.integer :ltnum
      t.integer :nownum
      t.string :ccode

      t.timestamps null: false
    end
    add_index :groups, [:ccode, :created_at]
  end
end
