namespace :database do
  desc "Ingest recipes from JSON into the database"
  task ingest_recipes: :environment do
    file_path = Rails.root.join('db', 'recipes-en.json')
    recipes = JSON.parse(File.read(file_path))

    recipes.each do |recipe_data|
      Recipe.create(
        title: recipe_data['title'],
        cook_time: recipe_data['cook_time'],
        prep_time: recipe_data['prep_time'],
        ingredients: recipe_data['ingredients'],
        ratings: recipe_data['ratings'],
        cuisine: recipe_data['cuisine'],
        category: recipe_data['category'],
        author: recipe_data['author'],
        image: recipe_data['image']
      )

      puts "created #{recipe_data['title']}"
    end

    puts "Successfully ingested #{recipes.size} recipes!"
  end
end