class CreateArticle2s < ActiveRecord::Migration[5.1]
  def change
    create_table :article2s do |t|
      t.text :content
      t.date :date

      t.timestamps
    end
  end
end
