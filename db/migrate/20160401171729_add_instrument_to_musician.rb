class AddInstrumentToMusician < ActiveRecord::Migration
  def change
    create_table :instruments_musicians, id: false do |t|
      t.belongs_to :instrument, index: true
      t.belongs_to :musician, index: true
    end
  end
end
