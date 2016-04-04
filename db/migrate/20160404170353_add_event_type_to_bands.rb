class AddEventTypeToBands < ActiveRecord::Migration
  def change
    create_table :bands_event_types, id: false do |t|
      t.belongs_to :band, index: true
      t.belongs_to :event_type, index: true
    end
  end
end
