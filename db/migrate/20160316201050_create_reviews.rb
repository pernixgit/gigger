class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.string :string
      t.references :musician, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
