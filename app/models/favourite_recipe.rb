class FavouriteRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
end
