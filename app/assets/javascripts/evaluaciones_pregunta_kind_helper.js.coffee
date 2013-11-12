window.Helpers.EvaluacionesPreguntaKindHelper =

  showAddAnswersButtonIn: ($div) ->
    $div.find(".add_respuesta_button").show()

  hideAddAnswersButtonIn: ($div) ->
    $div.find(".add_respuesta_button").hide()

  removeAnswersIn: ($div) ->
    for button in $div.find(".delete_answer_button")
      $(button).trigger "click"

  changed: ->
    self = window.Helpers.EvaluacionesPreguntaKindHelper
    $question_parent = $(this).parent().parent()
    if @value == "Seleccionar una opción"
      self.showAddAnswersButtonIn $question_parent
    else
      self.removeAnswersIn $question_parent
      self.hideAddAnswersButtonIn $question_parent
      if @value == "Verdadero o Falso"
        console.log "VoF"
      else if @value == "Escriba la respuesta"
        console.log "Escriba"
      else if @value == "Escoja la respuesta"
        console.log "Escoja"

  init: ->
    $(document).on "change", ".question_kinds_fields select", @changed

window.Helpers.EvaluacionesPreguntaKindHelper.init()
