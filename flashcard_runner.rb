require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'

card_1 = Card.new("What is 5 + 5?", "10", :STEM)
card_2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_3 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_4 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_5 = Card.new("A^2 + B^2 = ?", "C^2", :STEM)
card_6 = Card.new("H + 2O -> ?", "H2O", :STEM)
card_7 = Card.new("Who are the big four?", "Amazon, Apple, FB, Google", :STEM)
card_7 = Card.new("What is 5 * 5?", "25", :STEM)
cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7]
deck = Deck.new(cards)
round = Round.new(deck)

round.start
cards.each do
  #round.@turns.count < round.@deck.count
  puts "This is card number #{round.turns.count + 1} out of #{round.deck.count}"
  puts "Question: #{round.current_card.question}?"
  guess = gets.chomp.to_s
  puts round.take_turn(guess).feedback
end
puts ""
round.end
puts "You had #{round.number_correct} correct guesses out of #{round.turns.count}
for a total score of #{round.percent_correct}%."
puts "STEM - #{round.percent_correct_by_category(:STEM)}% correct"
puts "Geography - #{round.percent_correct_by_category(:Geography)}% correct"
puts "Pop Culture - #{round.percent_correct_by_category(:Pop_Culture)}% correct"
