require './lib/card'
require pry

class Turn
  attr_accessor :string, :guess

  def initialize(string, Card)
    @guess = string
  end

  def guess
    @guess = string
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
