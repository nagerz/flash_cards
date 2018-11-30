require './lib/turn'

class Round
  attr_reader :deck, :turns, :current_card

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card = deck.cards[@turns.count]
  end

  def take_turn(string)
    new_turn = Turn.new(string, @current_card)
    @turns << new_turn
    @current_card = deck.cards[@turns.count]
    new_turn
  end

  def number_correct
    number_correct = 0
    turns.each do |guess|
    if guess.correct? == true
      number_correct += 1
    end
    end
    number_correct
  end

  def number_correct_by_category(category)
    number_correct_category = 0
    turns.each do |guess|
    if guess.correct? == true && guess.card.category == category
      number_correct_category += 1
    end
    end
    number_correct_category
  end

  def percent_correct
    number_correct = 0
    total = turns.count
    turns.each do |guess|
    if guess.correct? == true
      number_correct += 1.0
    end
    end
    return ((number_correct / total) * 100).round(1)
  end

  def percent_correct_by_category(category)
    number_correct_category = 0
    cat_total = 0
    turns.each do |guess|
    if guess.card.category == category
      cat_total += 1
      if guess.correct? == true
      number_correct_category += 1.0
      end
    end
    end
    ((number_correct_category / cat_total) * 100).round(1)
  end

  def start
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "---------------------------"
  end

  def end
    puts "****** Game over! ******"
  end
end
