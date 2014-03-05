class CardCollection
  attr_accessor :cards

  def initialize
    self.cards = []
  end

   def initWithCoder(decoder)
    self.cards = decoder.decodeObjectForKey('cards')
    self
  end

  def encodeWithCoder(encoder)
    encoder.encodeObject(self.cards, forKey:'cards')
  end

end
