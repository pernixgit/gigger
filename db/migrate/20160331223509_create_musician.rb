class CreateMusician < ActiveRecord::Migration
  def change
    create_table :musicians do |t|
      t.string :name
      t.string :last_name
      t.string :identification
      t.string :phone

      t.timestamps null: false
    end
  end
end
