
require "spec_helper"

describe "Accommodations Management", :type => :request do 

  describe 'creating a new accommodation' do

    it 'renders form and creates a new accommodation' do
      # Sign in as a user:
      sign_in_as_a_valid_user
      get "/accommodations/new"
      expect(response).to render_template(:new)

      post "/accommodations", :accommodation => FactoryGirl.attributes_for(:accommodation)

      expect(response).to redirect_to(assigns(:accommodation))
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include('Beautiful views and lots of sun.')
    end

  end


    describe 'searching for an accommodation' do

    it 'renders search results page' do

      get "/"
      expect(response.body).to include('Search')

      get '/accommodation_search/', simple_search: { city: "San Francisco" }

      expect(response).to render_template(:search)

    end

  end

end
