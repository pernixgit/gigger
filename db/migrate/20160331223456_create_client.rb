class CreateClient < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :last_name
      t.string :identification
      t.string :phone

      t.timestamps null: false
    end
  end
end
