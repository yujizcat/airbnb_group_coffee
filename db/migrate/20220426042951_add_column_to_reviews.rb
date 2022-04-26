class AddColumnToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :name, :string
    add_column :reviews, :content, :string
  end
end
