class Accommodation < ActiveRecord::Base

 # This Paperclip method associates the attribute ":image" with a file attachment
  has_attached_file :image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Paperclip method to validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  # Create ActiveRecord methods to facilitate data retrieval:
  belongs_to :user

  validates :price, presence: true, inclusion: { in: 0..20000, message: "The price must be between 0 and 20000"}
  validates :description, presence: true, length: { minimum: 4, maximum: 6000}
  validates :listing_type, presence: true 

  validate :valid_choice

  validates :city, presence: true
  validates :address1, presence: true
  validates :state, presence: true
  validates :zip, presence: true, length: { minimum: 5, maximum: 10}
  validates :phone, presence: true, length: { minimum: 7, maximum: 100}

  


  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def full_street_address
    [address1, address2, city, state, zip].compact.join(', ')
  end

  def valid_choice
    if listing_type != "Entire home/apt." && listing_type != "Private room" && listing_type!= "Shared room" 
      errors.add(:listing_type, "You must choose a valid listing type. Entire home/apt., Private room or Shared room.")
    end
  end

end
