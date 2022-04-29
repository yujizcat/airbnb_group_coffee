class AddStarandbookToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :star, :integer
    add_column :properties, :booked, :integer
  end
end
