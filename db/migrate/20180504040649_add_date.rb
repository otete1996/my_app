class AddDate < ActiveRecord::Migration[5.1]
  def change
    add_column :articles,:date,:date
  end
end
