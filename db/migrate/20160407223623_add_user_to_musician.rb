class AddUserToMusician < ActiveRecord::Migration
  def change
    add_reference :users, :musician, index: true, foreign_key: true
  end
end
