require_relative "environment"

Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")

# test out your code here!


# charmander = Pokemon.new
# charmeleon = Pokemon.new
# charzard = Pokemon.new
