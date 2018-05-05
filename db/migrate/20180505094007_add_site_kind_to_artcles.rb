class AddSiteKindToArtcles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :site_kind, :integer,default: 0
  end
end
