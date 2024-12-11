require 'test_helper'
require 'bcrypt'

class FavouriteRecipesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @recipe = recipes(:one)
    @favourite_recipe = favourite_recipes(:one)
    sign_in @user
  end

  test "should create favourite recipe" do
    @favourite_recipe.destroy!

    assert_difference("FavouriteRecipe.count", 1) do
      post favourite_recipes_path, params: { recipe_id: @recipe.id }
    end

    assert_redirected_to :pages_index
  end

  test "should not create duplicate favourite recipe" do
    FavouriteRecipe.create(user: @user, recipe: @recipe)

    assert_no_difference("FavouriteRecipe.count") do
      post favourite_recipes_path, params: { recipe_id: @recipe.id }
    end

    assert_redirected_to :pages_index
  end

  test "should destroy favourite recipe" do
    assert_difference("FavouriteRecipe.count", -1) do
      delete favourite_recipe_path(@favourite_recipe)
    end

    assert_redirected_to user_path(@user)
  end
end
