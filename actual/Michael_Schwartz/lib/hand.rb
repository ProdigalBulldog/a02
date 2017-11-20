require 'byebug'

class Hand
  attr_reader :books, :cards

  def initialize(cards = [])
    @cards = cards
    @books = 0
  end

  def include?(value)
    cards.each do |card|
      return true if card.value == value
    end
    false
  end

  def empty?
    cards.empty?
  end

  def count
    cards.count
  end

  def give_up(value)
    cards_to_give = cards.select { |card| card.value == value}
    @cards = cards.reject { |card| card.value == value}
    cards_to_give
  
    # return [] unless include?(value)
    
  end

  def receive(new_cards)
    @cards += new_cards
  end

  # This method isn't tested, but we strongly recommend you implement it as a
  # helper method. It should return a hash mapping values to the number of
  # matching cards in the hand (e.g., { king: 2, deuce: 3 })
  def count_sets
    sets = Hash.new(0)
    cards.each do |card|
      sets[card.value] += 1
    end
# debugger
    sets
  end

  def play_books
    sets = count_sets
    sets.each do |val, num|
      if num == 4
        @books += 1
        @cards = cards.reject { |card| card.value == val}
      end
    end
  end
end
