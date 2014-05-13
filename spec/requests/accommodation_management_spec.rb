# accommodation_management_spec.rb

require "spec_helper"



describe "Accommodations Management" do 

# before :each do 
#   @user = User.create(email:'gt@nf.com', first_name:'George', last_name:'Tyrebiter', password:'87654321', password_confirmation:'87654321')
#   sign_in @user
#   # request.env['warden'].stub :authenticate! => @user
#   # ApplicationController.any_instance.stub(:current_user).and_return(@user)
#   # ApplicationController.any_instance.stub(:user_signed_in?) {true}
  
# end
  describe 'creating a new accommodation' do

    it 'renders form and creates a new accommodation' do
      # Sign in as a user:
      sign_in_as_a_valid_user
      get "/accommodations/new"
      expect(response).to render_template(:new)

      post "/accommodations", :accommodation => {price: 100, description:'Beautiful views and lots of sun.', listing_type:'room', locale:'Glen Park', city:'San Francisco', address1:'145 Moreland Street', address2:'', state:'CA', zip:'94131', phone:'(415)555-1212', user_id: 1}

      expect(response).to redirect_to(assigns(:accommodation))
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include('Beautiful views and lots of sun.')
    end

  end
end