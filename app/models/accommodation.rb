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

  

  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def full_street_address
    [address1, address2, city, state, zip].compact.join(', ')
  end

end
