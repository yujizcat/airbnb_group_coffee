class AddColumnsToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :name, :string
    add_column :bookings, :content, :string
  end
end
