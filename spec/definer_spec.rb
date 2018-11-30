require('pry')
require('rspec')
require('definer')

describe("Word")do

  before()do
      Word.clear()
  end

  describe("#add_word")do
    it("add a word and its defintion to the list of words. It also assigns a unique id to each word")do
    input_word = Word.new("abolish", "formally put an end to")
    input_word.add_word(input_word.word, input_word.definition)
    expect(Word.word_list()).to(eq([[0, "abolish", "formally put an end to"]]))
    end
  end

  describe("#find_word")do
    it("finds a word based off of unique id")do
      input_word = Word.new("abolish", "formally put an end to")
      input_word.add_word(input_word.word, input_word.definition)
      expect(Word.find_word(0)).to(eq([0, "abolish", "formally put an end to"]))
    end
  end

  describe("#add_definition")do
    it("adds a second definition to a word")do
    word = Word.new("abolish", "formally put an end to")
    word.add_word(word.word, word.definition)
    word.add_definition(0, "to completely do away with something")
    expect(Word.word_list()).to(eq([[0, "abolish", "formally put an end to", "to completely do away with something"]]))
    end
  end

end
