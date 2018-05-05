class CreatePost2s < ActiveRecord::Migration[5.1]
  def change
    create_table :post2s do |t|
      t.text :content
      t.integer :user_id
      t.integer :article2_id

      t.timestamps
    end
  end
end
