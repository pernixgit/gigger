class AssociateBandsAndGenres < ActiveRecord::Migration
  def change
    create_table :bands_genres, id: false do |t|
      t.belongs_to :band, index: true
      t.belongs_to :genre, index: true
    end
  end
end
