module ApplicationHelper

  def form_errors_for(object)
    if object.errors.any?
      content = pluralize object.errors.count, "error", "errores"
      content += raw "<ul>"
      object.errors.full_messages.each do |msg|
        content += raw content_tag :li, msg
      end
      content += raw "</ul>"
      content_tag :div, id: "error_explanation", :class => "alert alert-error" do
        raw content
      end
    end
  end

end
