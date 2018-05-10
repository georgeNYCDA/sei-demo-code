require 'chuck_norris'

class ChuckJokes

	def help
		'blah blah blah'
	end

	def get_joke_by_id(id)
		specific_joke = ChuckNorris::JokeFinder.find_joke(id)
		specific_joke.joke
	end

	def replace_name(f_name, l_name)
		joke = ChuckNorris::JokeFinder.get_joke(first_name: f_name, last_name: l_name)
		joke.joke
	end

	def random
		joke = ChuckNorris::JokeFinder.get_joke
		joke.joke
	end
end