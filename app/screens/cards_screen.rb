class CardsScreen < PM::Screen
  attr_accessor :cards_id
  include CardStyles

  def on_load
    set_nav_bar_button :right, title: "Edit", action: :open_edit_cards
    add Card.new, :global_label_style
  end

  def view_did_load
    @label = add UITextView.new, {
      font: UIFont.systemFontOfSize(32),
      frame: [[  18,  90 ], [ 285, 400 ]],
      text_alignment: NSTextAlignmentCenter
    }
    self.navigationItem.rightBarButtonItem = editButton
  end

  def will_appear
    set_attributes self.view, {
      background_color: hex_color("FF6666")
    }

    @label.text = app_delegate.cards[self.cards_id][:bio]
    self.title = app_delegate.cards[self.cards_id][:title]
  end

  def edit
    self.navigationItem.setRightBarButtonItem(saveButton, animated:true)
    @label.editable = true
    @label.becomeFirstResponder
  end

  def save
    self.navigationItem.setRightBarButtonItem(editButton, animated:true)
    @label.resignFirstResponder
    @label.editable = false
    app_delegate.cards[self.cards_id][:bio] = @label.text
  end

  def editButton
    @editButton ||= UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemEdit, target:self, action:'edit')
  end

  def saveButton
    @saveButton ||= UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemSave, target:self, action:'save')
  end

end
