require './lib/card'

class CardGenerator

  def initialize(textfile)
    @textfile = textfile
  end

  def cards
    #Create empty array for cards from text file to be placed (deck).
    textcards = []
    #Create array stings that represent each line from text file.
    card_substrings = IO.readlines(@textfile)
    #Seperate answer, question, and category from each line substring,
    #create card array, place card arrays in single array which is returned.
    card_substrings.each do |n|
      info_substrings = n.split(",")
      card = Card.new(info_substrings[0], info_substrings[1], info_substrings[2])
      textcards << card
    end
      return textcards
  end
end
