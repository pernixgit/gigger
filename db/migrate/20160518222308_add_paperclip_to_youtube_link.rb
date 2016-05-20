class AddPaperclipToYoutubeLink < ActiveRecord::Migration
  def change
    add_attachment :youtube_links, :image
  end
end
