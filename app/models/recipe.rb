class Recipe < ApplicationRecord
  validates :title, :cook_time, :prep_time, :ingredients, presence: true
  validates :title, uniqueness: true

  def self.search_by_ingredients(ingredients)
    return all if ingredients.blank?

    # Split the query into individual ingredients
    ingredients = ingredients.downcase.split

    # Match recipes containing any of the ingredients
    conditions = build_conditions(ingredients)
    values = build_values(ingredients)

    where(conditions, *values)
  end

  private

  private

  def self.build_conditions(ingredients)
    # create a comparison condition and set up the query string to combine the ingredients
    ingredients.map { "LOWER(ingredients) LIKE ?" }.join(' AND ')
  end

  def self.build_values(ingredients)
    # produce the string of ingredients separated by spaces,
    # to be substituted into the ? part of the query string
    ingredients.map { |ingredient| "%#{ingredient}%" }
  end
end
