class AddPaperclipToClient < ActiveRecord::Migration
  def change
    add_attachment :clients, :image
  end
end
