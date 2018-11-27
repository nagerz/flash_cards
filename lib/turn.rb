#require './lib/card.rb'

class Turn
  attr_reader :string, :guess, :card

  def initialize(string, card)
    @guess = string
    @card = card
  end

  def correct?
    guess == card.answer
  end

  def feedback
    if turn.correct? == true
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end
end
