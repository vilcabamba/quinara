module AdminHelper
  def title(text)
    content_tag :div, :class => "align_center" do
      content_tag :h2, text
    end
  end
end
