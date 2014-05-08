class AddImageToAccommodations < ActiveRecord::Migration
  def change
    add_attachment :accommodations, :image
  end

  # The lines below from the Paperclip document are outdated.
  # Rails now automatically creates a method for dropping, so
  # Only the add_attachment part is needed. 
  
  # def self.up
  #   add_attachment :accommodations, :image
  # end

  # def self.down
  #   remove_attachment :accommodations, :image
  # end

end
