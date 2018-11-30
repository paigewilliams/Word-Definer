require('pry')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definer')

get('/') do
  @word_list = Word.word_list()

  erb(:input)
end

get('/words')do
  @word_list = Word.word_list()
  @@display = "display:none"
  erb(:output)
end

post('/words')do

  word = params[:word]
  definition = params[:definition]
  @input_word = Word.new(word, definition)
  @input_word.add_word(word, definition)
  @word_list = Word.word_list()

  erb(:output)
end

get('/definition/:id') do
  @word_list = Word.word_list()
  @id = params[:id].to_i
  @word = Word.find_word(@id)

  erb(:definition)
end

get('/add/definition/:id') do
  @word_list = Word.word_list()
  @id = params[:id].to_i
  erb(:add_definition)
end

post('/add_additional_definition') do
  @word_list = Word.word_list()
  id = params[:id].to_i
  definition = params[:additional_definition]
  @word = Word.find_word(id)
  @word.push(definition)
  @word_list = Word.word_list()

  erb(:definition)
end


# [[0, "abolish", "formally put an end to", "to get rid of", "sometimes"]]
