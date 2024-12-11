class PagesController < ApplicationController
  include Pagy::Backend

  def index
    @user = current_user
    @pagy, @recipes = pagy(Recipe.filtered_and_sorted(params), items: 20)
  end
end
