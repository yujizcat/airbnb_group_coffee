class Booking < ApplicationRecord
  belongs_to :user, :property
end
