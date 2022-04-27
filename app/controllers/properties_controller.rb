class PropertiesController < ApplicationController
  before_action :set_property, only: [:show]

  def index
    @properties = Property.all
    @hello = Property.last.city
  end

  def show
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
