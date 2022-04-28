class PropertiesController < ApplicationController
  before_action :set_property, only: [:show]

  def index
    @properties = Property.all
    #@properties = Property.where("price > ?", 100)

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
    if @property.save
      refirect_to property_path(@property)
    else
      render :new
    end
  end

  def button
    @properties = Property.where(:city => "Lake Leighannview")
    redirect_to properties_url
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :city, :address, :description, :pic)
  end
end
