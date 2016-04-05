class AddGenreToMusician < ActiveRecord::Migration
  def change
    create_table :genres_musicians, id: false do |t|
      t.belongs_to :genre, index: true
      t.belongs_to :musician, index: true
    end
  end
end
