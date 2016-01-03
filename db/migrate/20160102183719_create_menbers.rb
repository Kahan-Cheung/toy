class CreateMenbers < ActiveRecord::Migration
  def change
    create_table :menbers do |t|
      t.integer :authority
      t.integer :status
      t.string :message
      t.references :user, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
