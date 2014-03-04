class EditCards < PM::FormotionScreen
  attr_accessor :cards_id

  title "Edit Cards"

  def on_load
    set_nav_bar_button :left, title: "Cancel", action: :close_screen
  end

  def on_submit(form)
    data = form.render

    [['Category', :title]].each do |field|
      if data[field[1]].length > 25
        App.alert("#{field[0]} is too long")
        return
      elsif data[field[1]].length == 0
        App.alert("#{field[0]} is required")
      end
    end

    app_delegate.cards[self.cards_id] = data
    close
  end

  def close_screen
    close
  end

  def table_data
    {
      sections: [{
        rows: [ {
          title: "Category",
          key: :title,
          placeholder: "20 characters max",
          type: :string,
          value: app_delegate.cards[self.cards_id][:title]
        }, {
          title: "Content",
          key: :bio,
          type: :text,
          row_height: 100,
          value: app_delegate.cards[self.cards_id][:bio]
        },{
          title: "Photo",
          key: :photo,
          type: :image,
          image: "camera",
          deletable: true
        }]
      },{
        rows: [{
          title: "Update Card",
          type: :submit
        }]
      }]
    }
  end
end
