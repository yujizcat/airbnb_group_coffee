class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
  end

  def new
    @property = Property.find(params[:property_id])
    @favorite = Favorite.new
  end

  def show
  end

  def create
    @property = Property.find(params[:property_id])
    @favorite = Favorite.new
    @favorite.property = @property
    @favorite.user = current_user
    if @favorite.save
      redirect_to favorites_path
    else
      puts "error message => #{@property.errors.full_messages}"
      render :new
    end
  end
end
