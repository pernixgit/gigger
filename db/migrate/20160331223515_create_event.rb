class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.date :date
      t.time :time
      t.text :description
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
