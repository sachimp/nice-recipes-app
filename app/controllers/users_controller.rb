class UsersController < ApplicationController
  def show
    @user = current_user
    @favourite_recipes = @user.favourite_recipes
  end
end
