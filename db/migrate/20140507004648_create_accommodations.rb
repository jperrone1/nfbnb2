class CreateAccommodations < ActiveRecord::Migration
  def change
    create_table :accommodations do |t|
      t.integer :price
      t.text :description
      t.string :listing_type
      t.string :locale
      t.string :city
      t.text :address1
      t.text :address2
      t.string :state
      t.string :zip
      t.string :phone

      t.timestamps
    end
  end
end
