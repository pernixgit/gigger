class AddEventTypeToEvent < ActiveRecord::Migration
  def change
    create_table :events_event_types, id: false do |t|
      add_reference :events, :event_type, index: true, foreign_key: true
    end
  end
end
