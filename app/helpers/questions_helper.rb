module QuestionsHelper

  def status_for_question(question)
    if question.score_for_user(@user) == 0
      "error"
    elsif question.score_for_user(@user) == question.puntaje_maximo
      "success"
    else
      "warning"
    end
  end

  def show_media_for(object)
    if object.media_is_image?
      raw "<img src='#{object.media_url}'>
        <small class='legend'>
          <a class='btn btn-mini btn-default' href='#{object.media_url}' target='_blank'>Ver imagen en otra ventana</a>
        </small>
      "
    elsif object.media_is_video?
      raw "
        <video src='#{object.media_url}' controls>Lo sentimos, tu navegador no soporta video. Por favor utiliza otro navegador para poder ver este video</video>
        <small class='legend'>
          <a class='btn btn-mini btn-default' href='#{object.media_url}' target='_blank'>Ver video en otra ventana</a>
        </small>
      "
    elsif object.media_is_audio?
      raw "
        <audio src='#{object.media_url}' controls>Lo sentimos, tu navegador no soporta audio. Por favor utiliza otro navegador para poder escuchar este audio</audio>
        <div class='align_center'>
          <a class='btn btn-mini btn-default' href='#{object.media_url}' target='_blank'>Escuchar archivo de audio</a>
        </div>
      "
    end
  end

end
