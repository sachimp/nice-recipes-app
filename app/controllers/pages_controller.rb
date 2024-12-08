class PagesController < ApplicationController
  def index
    ingredients_param = params[:ingredients] # grab the entered string from the params
    @recipes = Recipe.search_by_ingredients(ingredients_param)
  end
end
