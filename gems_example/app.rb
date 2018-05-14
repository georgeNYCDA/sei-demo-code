require 'colorize'

require './chuck'

my_chuck_jokes = ChuckJokes.new


if ARGV.length == 2
	puts my_chuck_jokes.replace_name(ARGV[0], ARGV[1])
elsif ARGV.length == 1
	if ARGV[0] == 'random'
		puts my_chuck_jokes.random
	else
		puts my_chuck_jokes.get_joke_by_id(ARGV[0])
	end
else
	puts my_chuck_jokes.help.red
end