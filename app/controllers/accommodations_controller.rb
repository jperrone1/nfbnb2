class AccommodationsController < ApplicationController

  # Authenticate user using Devise for methods requiring sign-in: 
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def welcome

  end

  def index 
    # Presently I'm not showing all results anywhere; only by searching. 
    # @accommodations = Accommodation.all 

     @pins = Accommodation.all

    respond_to do |f|
      f.json { render :json => @pins}
    end

  end

# Need to modify this code to show pins for accommodations: 
  def pin_show

  end

  def search
    @search = SimpleSearch.new params.require(:simple_search).permit(:q, :max_price)
 
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
  end

  def new
    @accommodation = Accommodation.new
  end

  def create
    # You must be signed in to create a listing, and this code fills in your user id:  
    @accommodation = current_user.accommodations.new(accommodation_params)
    if @accommodation.save
     redirect_to @accommodation, notice: 'Listing was successfully created.'
     else 
       render action: 'new'
    end
  end

  def show
    @accommodation = Accommodation.find(params[:id])
  end

  def edit
    @accommodation = Accommodation.find(params[:id])
  end

  def update

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
