class Card
attr_accessor :name, :program, :ovr, :position, :price, :href

  def initialize(card_hash)
    card_hash.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def self.create_from_array(card_array)
    card_array.each do |card_hash|
      Card.new(card_hash)
    end
  end
end
