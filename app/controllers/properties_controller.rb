class PropertiesController < ApplicationController
  before_action :set_property, only: [:show]

  def index
    @properties = Property.all
    #@properties = Property.where(:city => "Lake Leighannview")
    @hello = Property.last.city
  end

  def show
  end

  def button
    @properties = Property.where(:city => "Lake Leighannview")
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :city, :address, :description, :pic)
  end
end
