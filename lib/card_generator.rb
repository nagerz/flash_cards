require './lib/card'

class CardGenerator

  def initialize(textfile)
    @textfile = textfile
  end

  def cards
    #text = File.open(@textfile)
    card_substrings = IO.readlines(@textfile)
    card_substrings.each do |n|
      info_substrings = n.split(",")
      card = Card.new(info_substrings[0], info_substrings[1], info_substrings[2])
      textcards << card
    end
      return textcards
  end

end
