class AddMusicianIdToYoutubeLink < ActiveRecord::Migration
  def change
    add_column :youtube_links, :musician_id, :integer
  end
end
