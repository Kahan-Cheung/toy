class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :name
      t.text :content
      t.references :group, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
