class Recipe < ApplicationRecord
  validates :title, :cook_time, :prep_time, :ingredients, presence: true
  validates :title, uniqueness: true

  has_many :favourite_recipes

  def self.search_by_ingredients(ingredients)
    return all if ingredients.blank?

    # Split the query into individual ingredients
    ingredients = ingredients.downcase.split

    # Match recipes containing any of the ingredients
    conditions = build_conditions(ingredients)
    values = build_values(ingredients)

    where(conditions, *values)
  end

  def self.sort_by_criteria(sort_by)
    case sort_by
    when 'time'
      order(Arel.sql('prep_time + cook_time ASC')) # Sort by combined prep + cook time
    when 'rating'
      order(ratings: :desc)
    else
      order(title: :asc) # Default sort, alphabetical I guess?
    end
  end


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
