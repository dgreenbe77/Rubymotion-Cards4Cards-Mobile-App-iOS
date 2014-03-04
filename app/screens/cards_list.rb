class CardsList < PM::TableScreen
  title "Cards List"

  searchable placeholder: "Find a Card"
  refreshable callback: :on_refresh,
              pull_message: "Pull to update",
              refreshing: "Refresing cards…",
              updated_format: "Last updated at %s",
              updated_time_format: "%l:%M %p"

  def on_load
    button =  UIButton.buttonWithType(UIButtonTypeCustom)
    button.setImage(UIImage.imageNamed("guide"), forState:UIControlStateNormal)
    button.addTarget(self, action: :open_guide, forControlEvents:UIControlEventTouchUpInside)
    button.setFrame [[ 0, 0 ], [ 32, 32 ]]
    set_nav_bar_button :left, button: UIBarButtonItem.alloc.initWithCustomView(button)
    set_nav_bar_button :right, system_item: :add, action: :add_card
  end

  def will_appear
    update_table_data
    set_attributes self.view, {
      background_color: hex_color("#FFFFFF")
    }
  end

  def open_guide
    open_modal Guide.new(nav_bar: true)
  end

  def add_card
    open_modal AddCard.new(nav_bar: true)
  end

  def open_cards(args)
    open CardsScreen.new(cards_id: args[:cards_id])
  end

  def table_data
    [{
      cells: app_delegate.cards.map do |cards|
        {
          title: cards[:title],
          subtitle: cards[:bio],
          action: :open_cards,
          editing_style: :delete,
          arguments: { cards_id: app_delegate.cards.index(cards) }
        }
      end
    }]
  end

  def on_cell_deleted(cell)
    app_delegate.cards.delete_at(cell[:arguments][:cards_id])
  end

  def on_refresh
    end_refreshing
  end
end
