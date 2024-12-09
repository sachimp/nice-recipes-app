class FavouriteRecipesController < ApplicationController
  def create
    FavouriteRecipe.create(
      user: current_user,
      recipe: Recipe.find(params[:recipe_id])
    )

    redirect_to :pages_index
  end
end
