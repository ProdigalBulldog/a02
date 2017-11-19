require 'byebug'

class Hand
  # This is a *factory method* that creates and returns a `Hand`
  # object.
  def self.deal_from(deck)
    self.new(deck.take(2))
  end

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def points
    points_total = 0
    
    normal_cards = cards.reject { |card| card.value == :ace }
    num_of_aces = cards.length - normal_cards.length
    
    points_total += num_of_aces + normal_cards.reduce(0) { |total, card| total += card.blackjack_value }
    
    while num_of_aces > 0 && points_total <= 21
      points_total += 10 if points_total + 10 <= 21
      num_of_aces -= 1
    end
    
    points_total
  end

  def busted?
    points > 21
  end

  def hit(deck)
    raise "already busted" if self.busted?
    self.cards += deck.take(1)
  end

  def beats?(other_hand)  
    return false if self.busted?
    return true if self.points > other_hand.points || other_hand.busted?
    false
  end

  def return_cards(deck)
    deck.return(self.cards)
    self.cards = []
  end

  def to_s
    @cards.join(",") + " (#{points})"
  end
end
