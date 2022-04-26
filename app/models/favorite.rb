class Favorite < ApplicationRecord
  belongs_to :user, :property
end
