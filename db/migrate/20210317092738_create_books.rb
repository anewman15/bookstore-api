class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :pages
      t.string :category
      t.boolean :completed
      t.integer :current_chapter
      t.integer :user_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
