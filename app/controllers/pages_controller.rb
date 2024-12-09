class PagesController < ApplicationController
  include Pagy::Backend

  def index
    @user = current_user
    ingredients_param = params[:ingredients]
    sort_by_params = params[:sort_by]

    recipes = Recipe.search_by_ingredients(ingredients_param)

    @pagy, @recipes = pagy(recipes.sort_by_criteria(sort_by_params), items: 20)
  end
end
