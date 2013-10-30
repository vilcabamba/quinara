module AdminHelper
  def navbar_active_class(name)
    if controller.class.name =~ Regexp.new(name, Regexp::IGNORECASE) then "class=active" end
  end
  def title(text)
    content_tag :div, :class => "align_center" do
      content_tag :h2, text
    end
  end
end
