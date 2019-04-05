class Card
attr_accessor :name, :program, :ovr, :position, :price, :href

# PLAYER_CARDS = []

  def initialize(card_hash)
    card_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    # PLAYER_CARDS << self unless PLAYER_CARDS.include?(self)
  end

  def self.create_from_array(card_array)
    card_array.each do |card_hash|
      Card.new(card_hash)
    end
  end

  # def self.all
  #   PLAYER_CARDS
  # end

  # def save
  #   PLAYER_CARDS << self unless PLAYER_CARDS.include?(self)
  # end
#binding.pry

#all
end
