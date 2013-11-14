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

  def show_media_for_question(question)
    if question.media_is_video?
      raw "
        <video src='#{question.media_url}' controls>Lo sentimos, tu navegador no soporta video. Por favor utiliza otro navegador para poder ver este video</video>
        <small class='video_legend'>
          <a href='#{question.media_url}' target='_blank'>Ver video en otra ventana</a>
        </small>
        "
    elsif question.media_is_audio?
      raw "
        <audio src='#{question.media_url}' controls>Lo sentimos, tu navegador no soporta audio. Por favor utiliza otro navegador para poder escuchar este audio</audio>
      "
    end
  end

end
