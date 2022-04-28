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
    @booking.property = @property
    @booking.user = current_user
    if @booking.save
      redirect_to bookings_path
    else
      puts "error message => #{@property.errors.full_messages}"
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :content)
  end
end
