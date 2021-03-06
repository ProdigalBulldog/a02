class Card
  SUIT_STRINGS = {
    clubs: '♣',
    diamonds: '♦',
    hearts: '♥',
    spades: '♠'
  }

  VALUE_STRINGS = {
    ace: 'A',
    deuce: '2',
    three: '3',
    four: '4',
    five: '5',
    six: '6',
    seven: '7',
    eight: '8',
    nine: '9',
    ten: '10',
    jack: 'J',
    queen: 'Q',
    king: 'K'
  }

  attr_reader :suit, :value

  def self.all_cards
    cards = []
    SUIT_STRINGS.keys.each do |suit|
      VALUE_STRINGS.keys.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

  def self.suits
    SUIT_STRINGS.keys
  end

  def self.values
    VALUE_STRINGS.keys
  end

  def initialize(suit, value)
    # raise "bad arguments" unless SUIT_STRINGS.keys.include?(suit) && VALUE_STRINGS.keys.include?(value)
    raise "bad arguments" unless self.class.suits.include?(suit) && self.class.values.include?(value)
    @suit, @value = suit, value
  end

  def to_s
    "#{VALUE_STRINGS[value]} #{SUIT_STRINGS[suit]}"
  end
end
