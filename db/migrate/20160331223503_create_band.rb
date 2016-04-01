class CreateBand < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.string :phone

      t.timestamps null: false
    end
  end
end
