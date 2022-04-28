class RemoveTypeFromProperties < ActiveRecord::Migration[6.1]
  def change
    remove_column :properties, :type, :string
  end
end
