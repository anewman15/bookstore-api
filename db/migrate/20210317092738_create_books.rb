class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :category
      t.integer :pages
      t.integer :current_page
      t.integer :current_chapter
      t.boolean :completed
      t.integer :user_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
