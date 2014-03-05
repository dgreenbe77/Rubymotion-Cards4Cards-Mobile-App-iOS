module CardStyles

  def main_view_style
    {
      background_color: hex_color("000000")
    }
  end

  def global_label_style
    {
      # background_color: hex_color("FF6666"),
      layer: {
        shadow_radius: 4.0,
        shadow_opacity: 0.4,
        shadow_color: UIColor.blackColor.CGColor,
        frame: [[  18,  90 ], [ 285, 400 ]]
      }
    }
  end

end

 # text: "Enter Card:",
      # text_color: hex_color("8F8F8D"),
      # background_color: UIColor.blackColor,
# shadow_color: UIColor.blackColor,
      # text_alignment: UITextAlignmentCenter,
      # font: UIFont.systemFontOfSize(15.0),
      # resize: [ :left, :right, :bottom ],
      # frame: CGRectMake(10, 10, 300, 35)
