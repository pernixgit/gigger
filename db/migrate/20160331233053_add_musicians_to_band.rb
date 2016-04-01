class AddMusiciansToBand < ActiveRecord::Migration
  def change
    add_reference :musicians, :band, index: true, foreign_key: true
  end
end
