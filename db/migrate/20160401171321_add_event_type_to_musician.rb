class AddEventTypeToMusician < ActiveRecord::Migration
  def change
    create_table :musicians_event_types, id: false do |t|
      t.belongs_to :musician, index: true
      t.belongs_to :event_type, index: true
    end
  end
end
