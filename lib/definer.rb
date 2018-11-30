class Word

  @@word_list = []


  attr_accessor(:word, :definition)

  def initialize(word, definition)
    @word = word
    @definition = definition
  end

  def self.word_list
    @@word_list
  end

  def self.clear()
    @@word_list = []
  end

  def add(word, definition)
    @@word_list.push([word, definition])
  end
end
