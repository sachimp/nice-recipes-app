class FavouriteRecipesController < ApplicationController
  before_action :set_recipe, only: :create
  before_action :set_favourite_recipe, only: :destroy

  def create
    FavouriteRecipe.create(user: current_user, recipe: @recipe)
    redirect_to :pages_index, notice: 'Recipe was successfully added to favourites.'
  end

  def destroy
    if @favourite_recipe.destroy
      redirect_to user_path(current_user), notice: 'Recipe was successfully deleted.'
    else
      redirect_to user_path(current_user), alert: 'Failed to delete the recipe.'
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def set_favourite_recipe
    @favourite_recipe = FavouriteRecipe.find(params[:id])
  end
end
