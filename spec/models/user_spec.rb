require 'spec_helper'

describe User do
  it 'should respond to all 5 user fields' do
    user = User.create(email:'gt@nf.com', first_name:'George', last_name:'Tyrebiter', password:'87654321', password_confirmation:'87654321')
    user.should respond_to(:email)
    user.should respond_to(:first_name)
    user.should respond_to(:last_name)
    user.should respond_to(:password)
    user.should respond_to(:password_confirmation)
  end
end