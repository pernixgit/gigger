class AddEventTypesToMusician < ActiveRecord::Migration
  def change
    create_table :event_types_musicians, id: false do |t|
      t.belongs_to :event_type, index: true
      t.belongs_to :musician, index: true
    end
  end
end
