class AddDiscountToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :discount, :integer
  end
end
