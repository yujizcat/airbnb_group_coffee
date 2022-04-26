class PropertiesController < ApplicationController
  def index
    @properties = Property.all
    #@properties = Property.where(:city => "Lake Leighannview")
    @hello = Property.last.city
  end

  def show
    @properties = Property.where(:city => "Lake Leighannview")
  end

  def find
    @properties = Property.where(:city => "Lake Leighannview")
  end
end
