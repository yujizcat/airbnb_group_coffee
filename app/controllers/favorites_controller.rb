class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def new
    @favorite = Favorite.new
  end

  def show
  end

  def create
    @property = Property.find(params[:list_id])
    @favorite = Favorite.new(favorite_params)
    @favorite.property = @property
    if @favorite.save
      redirect_to property_path
    else
      puts "error message => #{@property.errors.full_messages}"
      render :new
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:property_id, :user_id)
  end
end
