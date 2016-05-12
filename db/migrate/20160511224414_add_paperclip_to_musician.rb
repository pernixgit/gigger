class AddPaperclipToMusician < ActiveRecord::Migration
  def change
    add_attachment :musicians, :image
  end
end
