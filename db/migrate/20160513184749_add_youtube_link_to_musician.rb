class AddYoutubeLinkToMusician < ActiveRecord::Migration
  def change
    create_table :youtube_links_musicians, id: false do |t|
      t.belongs_to :youtube_link, index: true
      t.belongs_to :musician, index: true
    end
  end
end
