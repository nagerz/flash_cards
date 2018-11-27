require './lib/card'

class Turn
  attr_accessor :question, :answer, :category, :guess

  def initialize(string, card)
    @guess = string
    card = Card.new
  end

  def guess

  end

  def card

  end

  def correct?
    guess == card.answer
  end

  def feedback
    if correct? == true
      puts "Correct!"
    else
      puts "Incorrect."
    end
  end
end
