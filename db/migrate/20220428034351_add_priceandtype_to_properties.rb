class AddPriceandtypeToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :price, :integer
    add_column :properties, :type, :string
  end
end
