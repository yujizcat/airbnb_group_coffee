class AddForeignKeysToAllTables < ActiveRecord::Migration[6.1]
  def change
    Favorite.destroy_all
    add_foreign_key :favorites, :properties
    change_column_null :favorites, :property_id, false
    add_foreign_key :favorites, :users
    change_column_null :favorites, :user_id, false

    Booking.destroy_all
    add_foreign_key :bookings, :properties
    change_column_null :bookings, :property_id, false
    add_foreign_key :bookings, :users
    change_column_null :bookings, :user_id, false

    Review.destroy_all
    add_foreign_key :reviews, :bookings
    change_column_null :reviews, :booking_id, false

    Property.destroy_all
    add_foreign_key :properties, :users
    change_column_null :properties, :user_id, false
  end
end
