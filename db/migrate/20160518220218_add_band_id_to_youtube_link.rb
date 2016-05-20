class AddBandIdToYoutubeLink < ActiveRecord::Migration
  def change
    add_column :youtube_links, :band_id, :integer
  end
end
