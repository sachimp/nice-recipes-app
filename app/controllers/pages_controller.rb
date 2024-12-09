class PagesController < ApplicationController
  include Pagy::Backend
  def index
    ingredients_param = params[:ingredients] # grab the entered string from the params
    @pagy, @recipes = pagy((Recipe.search_by_ingredients(ingredients_param)), items: 20)
  end
end
