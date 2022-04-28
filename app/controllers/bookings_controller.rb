class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @property = Property.find(params[:property_id])
    @booking = Booking.new
  end

  def show
  end

  def create
    @property = Property.find(params[:property_id])
    @booking = Booking.new(booking_params)
    @booking.property = @booking
    if @booking.save
      redirect_to property_path
    else
      puts "error message => #{@property.errors.full_messages}"
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_id)
  end
end
