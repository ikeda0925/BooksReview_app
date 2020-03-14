class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :author
      t.text :review
      t.integer :evaluation
      t.string :book_image
      t.integer :user_id

      t.timestamps
    end
  end
end
