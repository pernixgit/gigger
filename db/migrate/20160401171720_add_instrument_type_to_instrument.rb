class AddInstrumentTypeToInstrument < ActiveRecord::Migration
  def change
    add_reference :instruments, :instrument_type, index: true, foreign_key: true
  end
end
