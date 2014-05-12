# accommodation_management_spec.rb

# require "spec_helper"

# describe "Accommodations Management" do 

#   describe 'creating a new accommodation' do

#     it 'renders form and creates a new accommodation' do
#       get "/accommodations/new"
#       expect(response).to render_template(:new)

#       post "/accommodations", :accommodation => {price: 100, description:'Beautiful views and lots of sun.', listing_type:'room', locale:'Glen Park', city:'San Francisco', address1:'145 Moreland Street', address2:'', state:'CA', zip:'94131', phone:'(415)555-1212', user_id: 1}

#       expect(response).to redirect_to(assigns(:accommodation))
#       follow_redirect!

#       expect(response).to render_template(:show)
#       expect(response.body).to include('Beautiful views and lots of sun.')
#     end

#   end
# end