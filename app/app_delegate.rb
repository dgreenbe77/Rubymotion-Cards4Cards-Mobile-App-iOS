class AppDelegate < PM::Delegate
  attr_accessor :cards

  def on_load(app, options)
    self.cards = CardCollection.new.cards
    open CardsList.new(nav_bar: true)
  end

end
