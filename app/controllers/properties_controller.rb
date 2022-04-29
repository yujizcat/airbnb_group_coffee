class PropertiesController < ApplicationController
  before_action :set_property, only: [:show]

  def index
    @properties = Property.all

    if params[:price].present?
      @properties = @properties.where("price <= ?", params[:price])
    end
    if params[:housing_type].present?
      @properties = @properties.where(:housing_type => params[:housing_type])
    end
    @hello = Property.last&.city
  end

  def new
    @property = Property.new
  end

  def show
  end

  def create
    @property = Property.new(property_params)
    @property.discount = 100
    @property.pic = ""
    @property.user = current_user
    if @property.save
      redirect_to properties_path(@property)
    else
      render :new
    end
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :city, :address, :description, :pic, :price, :housing_type)
  end
end
