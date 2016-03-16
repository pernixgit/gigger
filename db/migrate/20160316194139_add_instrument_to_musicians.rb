class AddInstrumentToMusicians < ActiveRecord::Migration
  def change
    add_column :musicians, :instrument, :string
  end
end
