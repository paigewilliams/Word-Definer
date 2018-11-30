class Word

  @@word_list = []
  @@counter = 0


  attr_accessor(:word, :definition)

  def initialize(word, definition)
    @word = word
    @definition = definition
    @id = @@counter
  end

  def self.word_list
    @@word_list
  end

  def self.clear()
    @@word_list = []
    @@counter = 0
  end

  def add_word(word, definition)
    @@counter += 1
    @@word_list.push([@id, word, definition])
  end

  def add_definition(id, defintion)
    word = Word.find_word(id)
    word.push(defintion)
  end

  def self.find_word(id)
    @@word_list.each do |word|
      if word[0] == id
        return word
      end
    end
  end
end
