class AddYoutubeLinkToBand < ActiveRecord::Migration
  def change
    create_table :youtube_links_bands do |t|
      t.belongs_to :youtube_link, index: true
      t.belongs_to :band, index: true
    end
  end
end
