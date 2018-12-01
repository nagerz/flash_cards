require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'

class CardgenTest < Minitest::Test

  def test_card_generator_exists
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename)

    assert_instance_of CardGenerator, cards
  end

  def test_cards_method
    filename = "./lib/cards.txt"
    cards = CardGenerator.new(filename)

    assert_equal Array, cards.cards.class
    assert_equal "10", cards.cards[0].answer
    assert_equal "What is Rachel's favorite animal?", cards.cards[1].question
    assert_equal :Food, cards.cards[4].category
    assert_equal 6, cards.cards.count
  end

end
