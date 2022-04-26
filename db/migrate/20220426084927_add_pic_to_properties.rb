class AddPicToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :pic, :string
  end
end
