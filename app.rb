require('pry')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definer')


get('/') do
  @word_list = Word.word_list()
  erb(:input)
end

post('/output')do
  word = params[:word]
  definition = params[:definition]
  @input_word = Word.new(word, definition)
  @input_word.add_word(word, definition)
  @word_list = Word.word_list()
  binding.pry
  erb(:input)
end
