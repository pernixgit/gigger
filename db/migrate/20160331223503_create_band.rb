class CreateBand < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false
      t.string :phone

      t.timestamps null: false
    end
  end
end
