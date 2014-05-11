require 'spec_helper'

describe Accommodation do
  it 'should respond to accommodation fields except image not tested here' do
    accommodation = Accommodation.create(price:100, description:'Beautiful views and lots of sun.', listing_type:'room', locale:'Glen Park', city:'San Francisco', address1:'145 Moreland Street', address2:'', state:'CA', zip:'94131', phone:'(415)555-1212')
    accommodation.should respond_to(:price)
    accommodation.should respond_to(:description)
    accommodation.should respond_to(:listing_type)
    accommodation.should respond_to(:locale)
    accommodation.should respond_to(:city)    
    accommodation.should respond_to(:address1)
    accommodation.should respond_to(:address2)
    accommodation.should respond_to(:state)
    accommodation.should respond_to(:zip)
    accommodation.should respond_to(:phone)
    end
end