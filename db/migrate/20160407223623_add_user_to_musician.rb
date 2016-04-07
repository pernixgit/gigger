class AddUserToMusician < ActiveRecord::Migration
  def change
    add_reference :musicians, :user, index: true, foreign_key: true
  end
end
