require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'
require "pry"

#Unused card inputs. Can use if no card text file supplied.
# card_1 = Card.new("What is 5 + 5?", "10", :STEM)
# card_2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_3 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_4 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# card_5 = Card.new("A^2 + B^2 = ?", "C^2", :STEM)
# card_6 = Card.new("H + 2O -> ?", "H2O", :STEM)
# card_7 = Card.new("Who are the big four?", "Amazon, Apple, FB, Google", :STEM)
# card_8 = Card.new("What is 5 * 5?", "25", :STEM)
#cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8]

#Uses supplied text file for card information to build the cards in the deck.
filename = "./lib/cards.txt"
cards = CardGenerator.new(filename).cards
deck = Deck.new(cards)
round = Round.new(deck)

#Makes an array of all categories without duplicated (for results purposes).
categories_array = []
cards.each do |card|
  if !categories_array.include?(card.category)
    categories_array << card.category
  end
end

#Starts round flash cards
round.start

#Prints same message and asks the question for each turn
cards.each do
  puts "This is card number #{round.turns.count + 1} out of #{round.deck.count}"
  puts "Question: #{round.current_card.question}?"
  guess = gets.chomp.to_s
  puts round.take_turn(guess).feedback
end
#Prints a new line after all the questions have been asked for visibility.
puts ""

#Ends the round after all cards have been completed with a Game Over statement.
round.end
#Prints results
puts "You had #{round.number_correct} correct guesses out of #{round.turns.count}
for a total score of #{round.percent_correct}%."
#Prints results by category (for any and all card categories).
categories_array.each do |cat|
  puts "#{cat} - #{round.percent_correct_by_category(cat)}% correct".delete!("\n")
end
