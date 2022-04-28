class AddTypeToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :housing_type, :string
  end
end
