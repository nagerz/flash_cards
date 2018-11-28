class Round
  attr_reader :deck, :turns, :current_card, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @turn_counter = 0
    @current_card = deck.cards[@turn_counter]
  end

  def take_turn(string)
    new_turn = Turn.new(string, @current_card)
    @turns << new_turn
    # if new_turn.correct? == true
    #   @number_correct += 1
    # end
    @turn_counter += 1
    @current_card = deck.cards[@turn_counter]
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
    return (number_correct / total) * 100
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
    return (number_correct_category / cat_total) * 100
  end

end
