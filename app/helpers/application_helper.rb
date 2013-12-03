module ApplicationHelper

  def navbar_active_class(name)
    if controller.class.name =~ Regexp.new(name, Regexp::IGNORECASE) then "class=active" end
  end

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

  def breadcrumb(links)
    content = ""
    links.each do |link|
      content += raw "<li"
      if link[:link]
        content += ">"
        content += content_tag :a, link[:text], href: link[:link]
        content += ' <span class="divider">/</span>'
      else
        content += " class='active'>"
        content += link[:text]
      end
      content += raw "</li>"
    end
    content_tag :ul, :class => "breadcrumb" do
      raw content
    end
  end

  def formato_evaluacion_inputs_for(term, evaluacion, section)
    html = '<div class="input-append ttip" title="Número de preguntas">'
    html += text_field_tag "terms[#{term}][#{evaluacion}][#{section}][preguntas]"
    html += '<span class="add-on">preguntas</span>'
    html += '</div>'
    html += '<div></div>'
    html += '<div class="input-append ttip" title="Puntos por pregunta">'
    html += text_field_tag "terms[#{term}][#{evaluacion}][#{section}][puntos]"
    html += '<span class="add-on">&nbsp;puntos&nbsp;&nbsp;&nbsp;</span>'
    html += '</div>'
    raw html
  end

end
