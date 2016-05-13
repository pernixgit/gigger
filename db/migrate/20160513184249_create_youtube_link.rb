class CreateYoutubeLink < ActiveRecord::Migration
  def change
    create_table :youtube_links do |t|
      t.string :url

      t.timestamps
    end
  end
end
