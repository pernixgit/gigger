class AddEventsToClient < ActiveRecord::Migration
  def change
    add_reference :events, :client, index: true, foreign_key: true
  end
end
