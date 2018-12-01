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
  erb(:word_list)
end

post('/words')do
  @@display = "display:block"
  word = params[:word].capitalize
  definition = params[:definition]
  @input_word = Word.new(word, definition)
  @input_word.add_word(word, definition)
  @word_list = Word.word_list()
  erb(:word_list)
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
