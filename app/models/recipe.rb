class Recipe < ApplicationRecord
  validates :title, :cook_time, :prep_time, :ingredients, presence: true
  validates :title, uniqueness: true
end
