class AddCard < PM::FormotionScreen
  title "Add Card"

  def on_load
    set_nav_bar_button :left, title: "Exit", action: :close_screen
  end

  def on_submit(form)
    data = form.render

    [['Category', :title]].each do |field|
      if data[field[1]].length > 20
        App.alert("#{field[0]} is too long")
        return
      elsif data[field[1]].length == 0
        App.alert("#{field[0]} is required")
      end
    end

    app_delegate.cards << data
    close
  end

  def close_screen
    close
  end

  def table_data
    {
      sections: [
        {
        rows: [{
          title: "Category",
          key: :title,
          placeholder: "20 characters max",
          type: :string
        },{
          title: "Content",
          key: :bio,
          type: :text,
          placeholder: "Enter your Content here...",
          row_height: 100
        },{
          title: "Photo",
          key: :photo,
          type: :image,
          image: "camera",
          deletable: true
        }]
      }, {
        rows: [{
          title: "Make Card",
          type: :submit
        }]
      }]
    }
  end
end
