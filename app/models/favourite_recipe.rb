class FavouriteRecipe < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :recipe_id, uniqueness: :true
end
