module ApplicationHelper

  def navbar_active_class(*names)
    names.each do |name|
      if controller.is_a?(AdminController) && !(name =~ Regexp.new("admin::", Regexp::IGNORECASE))
        # be restrictive with AdminControllers
        return false
      end
      if controller.class.name =~ Regexp.new(name, Regexp::IGNORECASE)
        return "class=active"
      end
    end
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
    html = ""
    if (evaluacion == 1 and section == "vocabulary") or
        (evaluacion == 1 and section == "writing")   or
        (evaluacion == 2 and section == "reading")
      html += hidden_field_tag "terms[#{term}][#{evaluacion}][#{section}][not_allowed]", true
    else
      html += '<div class="input-append ttip" title="Número de preguntas">'
      html += number_field_tag "terms[#{term}][#{evaluacion}][#{section}][preguntas]", (@formato.status_for(evaluacion, section)[:preguntas] if @formato)
      html += '<span class="add-on">preguntas&nbsp;</span>'
      html += '</div>'
      html += '<div></div>'
      html += '<div class="input-append ttip" title="Puntos por pregunta">'
      # if @formato && @formato.status_for(evaluacion, section)
        html += number_field_tag "terms[#{term}][#{evaluacion}][#{section}][puntos]", (@formato.status_for(evaluacion, section).fetch(:puntos, nil) if @formato)
      # end
      html += '<span class="add-on">puntos c/u</span>'
      html += '</div>'
    end
    raw html
  end

  def formato_evaluacion_results_for(evaluacion, section)
    status = @course.evaluacion_formato.status_text_for(evaluacion, section)
    html = status.join("<br />")
    raw html
  end
end
