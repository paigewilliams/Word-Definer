require('pry')
require('rspec')
require('definer')

describe("Word")do

  before()do
      Word.clear()
  end

  describe("#add")do
    it("add a word and its defintion to the list of words")do
    word = Word.new("abolish", "formally put an end to")
    word.add(word.word, word.definition)
    expect(Word.word_list()).to(eq([["abolish", "formally put an end to"]]))
    end
  end

end
