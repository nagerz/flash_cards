require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require "pry"
class CardgenTest < Minitest::Test

  def test_card_generator_exists
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename)

    assert_instance_of CardGenerator, cards
  end

  def test_cards_method
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename)
    #p cards.count
    assert_equal "10", cards.cards[0].answer
    assert_equal "10", cards.cards[0].answer
    assert_equal "What is Rachel's favorite animal?", cards.cards[1].question
    assert_equal :Food, cards.cards[2].category
    assert_equal "10", cards.cards[0].answer
    assert_equal "10", cards.cards[0].answer
  end

end
