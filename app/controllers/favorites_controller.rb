class FavoritesController < ApplicationController
  def favorite
    @favorites = Favorite.all
  end
end
