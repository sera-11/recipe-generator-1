require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

get("/") do
  redirect("/food_form")

end

get("/food_form") do

  erb(:food_form)
end

get("/get_foods") do
  @ingredient_one = params.fetch("ingredient_one").capitalize
  @ingredient_two = params.fetch("ingredient_two").capitalize
  @ingredient_three = params.fetch("ingredient_three").capitalize
  # build the API url, including the API key in the query string
  api_url = "https://api.spoonacular.com/recipes/findByIngredients/?apiKey=#{ENV["RECIPE_KEY"]}&ingredients=#{@ingredient_one},+#{@ingredient_two},+#{@ingredient_three}&number=20"

  # use HTTP.get to retrieve the API information
  raw_data = HTTP.get(api_url)

  # convert the raw request to a string
  raw_data_string = raw_data.to_s

  # convert the string to JSON
  @parsed_data = JSON.parse(raw_data_string)
  
  # get the symbols from the JSON
  #@symbols = parsed_data.fetch("currencies")
  #@recipe_id = parsed_data.fetch("id")

  erb(:get_foods)
end

get("/:get_foods/:get_recipe") do
  @recipe_id = params.fetch(:get_recipe)

  api_url = "https://api.spoonacular.com/recipes/#{@recipe_id}/information?apiKey=#{ENV["RECIPE_KEY"]}"

  # use HTTP.get to retrieve the API information
  raw_data = HTTP.get(api_url)

  # convert the raw request to a string
  raw_data_string = raw_data.to_s

  # convert the string to JSON
  @parsed_recipe = JSON.parse(raw_data_string)

  @title = @parsed_recipe.fetch("title")

  @instructions = @parsed_recipe.fetch("analyzedInstructions")
  @steps = @instructions.first.fetch("steps")

  @img_url = @parsed_recipe.fetch("image")
  
  erb(:get_recipe)
end
