module AdminHelper
  def title(text)
    content_tag :div, :class => "" do
      content_tag :h2, text
    end
  end
end
