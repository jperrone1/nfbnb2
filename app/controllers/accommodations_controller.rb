class AccommodationsController < ApplicationController

  # Authenticate user using Devise for methods requiring sign-in: 
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def welcome
    # This goes to the home page of the app. 
  end

  def index 
    # Presently I'm not showing all results anywhere; only by searching. 
  end

  def search
    # This method handles searches for both the home page and search results pages
    @search = SimpleSearch.new params.require(:simple_search).permit(:q, :max_price, :zip)
 
    if @search.valid?
      @accommodations = @search.search_accomodations_by_form.order(:price => :desc)
    else 
      flash[:errors]=@search.errors.full_messages
    end
  end

  def results
    # This line allows searching with city name in upper or lower case. 
    @accommodations = Accommodation.where("lower(city)=?", params[:search][:city].downcase)
    @accommodations = @accommodations.order(:price)

    # This code renders the search results both as JSON for the Map AJAX call, and 
    # as html to display the results: 
    respond_to do |f|
      f.json { render :json => @accommodations}
      f.html
    end
  end

  def new
    # Create an empty new accommodation object, to be filled in with the form: 
    @accommodation = Accommodation.new
  end

  def create
    # You must be signed in to create a listing, and this code fills in your user id.
    # Then if all is well, it saves the new accommodation to the database.   
    @accommodation = current_user.accommodations.new(accommodation_params)
    if @accommodation.save
     redirect_to @accommodation, notice: 'Listing was successfully created.'
     else 
       render action: 'new'
    end
  end

  def show
    # This method shows the details of a specific accommodation: 
    @accommodation = Accommodation.find(params[:id])
  end

  def edit
    # This method brings up the data of the selected record for editing: 
    @accommodation = Accommodation.find(params[:id])
  end

  def update
    # This method updates the data if the record is owned by the user: 
    @accommodation = Accommodation.find(params[:id])
      if @accommodation.user_id == current_user.id
        @accommodation.update_attributes accommodation_params
        redirect_to(accommodation_path)
      else
        flash[:errors]="You can't edit this because it's not yours."
        redirect_to(accommodation_path)
      end
  end

  def destroy
    # This method deletes the record if it is owned by the user: 
    @accommodation = Accommodation.find(params[:id])
      if @accommodation.user_id == current_user.id
        @accommodation.delete
        redirect_to(accommodation_path)
      else
        flash[:errors]="You can't delete this because it's not yours."
        redirect_to(accommodation_path)
      end
  end

  private
    def accommodation_params
      params.require(:accommodation).permit(:price, :description, :listing_type, :locale, :city, :address1, :address2, :state, :zip, :phone, :image)
    end

end
