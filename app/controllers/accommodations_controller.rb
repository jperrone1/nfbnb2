class AccommodationsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index 
    # @accommodation = Accommodation.new
    @accommodations = Accommodation.all
  end

  def results
    @accommodations = Accommodation.where("lower(city)=?", params[:search][:city].downcase)
  end

  def new
    @accommodation = Accommodation.new
  end

  def create
    @accommodation = Accommodation.new(accommodation_params)
    @accommodation.user_id = current_user.id
    if @accommodation.save
     redirect_to @accommodation, notice: 'Listing was successfully created.'
     else 
       render action: 'new'
    end
  end

  # def create
  #   accommodation = Accommodation.create accommodation_params
  #   redirect_to(accommodation)
  # end

  def show
    @accommodation = Accommodation.find(params[:id])
#     @ingredients = @recipe.ingredients
  end

  def edit
    @accommodation = Accommodation.find(params[:id])
  end

  def update
    accommodation = Accommodation.find(params[:id])
    accommodation.update_attributes accommodation_params
    redirect_to(accommodation)
  end

  def destroy
    accommodation = Accommodation.find(params[:id])
    accommodation.delete
    redirect_to(accommodations_path)
  end

  private
    def accommodation_params
      params.require(:accommodation).permit(:price, :description, :listing_type, :locale, :city, :address1, :address2, :state, :zip, :phone, :image)
    end

end



# def edit
    
#     @chair = current_user.chairs.find_by_id(params[:id])
    
#     if @chair.nil?
#       flash[:notice] = "Not Authorized!"
#       redirect_to chairs_path
#     else 
#       render :edit
#     end
#   end

#   def update
#     @chair = current_user.chairs.find_by_id(params[:id])
#     if @chair.nil?
#       render :file => "#{Rails.root}/public/422", :layout => false, :status => 422
#     end
#     #not sure what attributes is doing here
#     @chair.update_attributes chair_params 
#     redirect_to(@chair)
#     # end
#   end

#   def destroy
#     begin
#       @chair = current_user.chairs.find(params[:id])
#       @chair.destroy
#       redirect_to(dashboard_path)
#     rescue 
#       render :file => "#{Rails.root}/public/422", :layout => false, :status => 422
#     end
#   end

# class RecipesController < ApplicationController
#   include RecipesHelper

#   before_filter :signed_in_user, only: [:create, :new, :edit, :update, :destroy]
#   before_filter :check_recipe_owner, only: [:edit, :update, :destroy]

#   def index
#     @recipes = Recipe.all
#   end

#   def new
#     @recipe = Recipe.new
#   end

#   def create
#     recipe = Recipe.create recipe_params
#     redirect_to(recipe)
#   end

#   def show
#     @recipe = Recipe.find(params[:id])
#     @ingredients = @recipe.ingredients
#   end

#   def edit
#     @recipe = Recipe.find(params[:id])
#   end

#   def update
#     recipe = Recipe.find(params[:id])
#     recipe.update_attributes recipe_params
#     redirect_to(recipe)
#   end

#   def destroy
#     recipe = Recipe.find(params[:id])
#     recipe.delete
#     redirect_to(recipes_path)
#   end

#   private
#     def recipe_params
#       params.require(:recipe).permit(:name, :course, :cooktime, :servingsize, :instructions, :image)
#     end
# end