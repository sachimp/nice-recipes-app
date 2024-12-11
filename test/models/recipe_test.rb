require 'test_helper'
require 'bcrypt'

class RecipeTest < ActiveSupport::TestCase

  setup do
    @recipe1 = recipes(:one)
    @recipe2 = recipes(:two)
  end

  test "filtered_and_sorted should filter recipes by ingredients" do
    @recipe1.update(ingredients: "bread, egg, cinnamon")
    @recipe2.update(ingredients: "beef, tomato, garlic")

    params = { ingredients: "garlic" }

    results = Recipe.filtered_and_sorted(params)

    assert_not_includes results, @recipe1
    assert_includes results, @recipe2
  end

  test "filtered_and_sorted should sort recipes by time" do
    @recipe1.update(prep_time: 5, cook_time: 10)
    @recipe2.update(prep_time: 15, cook_time: 30)

    params = { sort_by: "time" }

    results = Recipe.filtered_and_sorted(params)

    assert_equal [@recipe1, @recipe2], results
  end

  test "filtered_and_sorted should sort recipes by rating" do
    @recipe1.update(ratings: 4.5)
    @recipe2.update(ratings: 3.0)

    params = { sort_by: "rating" }

    results = Recipe.filtered_and_sorted(params)

    assert_equal [@recipe1, @recipe2], results
  end

  test "filtered_and_sorted should default to alphabetical sorting by title" do
    @recipe1.update(title: "B recipe")
    @recipe2.update(title: "A recipe")

    params = { sort_by: nil }

    results = Recipe.filtered_and_sorted(params)

    assert_equal @recipe2, results.first
  end

  test "decoded_image_url should return decoded URL" do
    @recipe1.update(image: "http://example.com/image?url=http%3A%2F%2Fexample.com%2Fimage.jpg")

    assert_equal "http://example.com/image.jpg", @recipe1.decoded_image_url
  end

  test "decoded_image_url should return nil if image is not present" do
    @recipe1.update(image: nil)
    assert_nil @recipe1.decoded_image_url
  end

  test "decoded_image_url should return nil if image does not include 'url='" do
    @recipe1.update(image: "http://example.com/image.jpg")
    assert_nil @recipe1.decoded_image_url
  end
end
