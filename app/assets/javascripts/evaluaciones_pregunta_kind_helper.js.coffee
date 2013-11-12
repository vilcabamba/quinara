window.Helpers.EvaluacionesPreguntaKindHelper =

  showOpcionFieldIn: ($div) ->
    $div.removeClass("hide_opcion_field").addClass "hide_checkbox_field"

  hideOpcionFieldIn: ($div) ->
    $div.removeClass("hide_checkbox_field").addClass "hide_opcion_field"

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
    if @value == "Seleccionar una opción" or @value == "Escoja la respuesta"
      self.showAddAnswersButtonIn $question_parent
      if @value == "Seleccionar una opción"
        self.hideOpcionFieldIn $question_parent
      else
        self.showOpcionFieldIn $question_parent
    else
      self.removeAnswersIn $question_parent
      self.hideAddAnswersButtonIn $question_parent
      if @value == "Verdadero o Falso"
        console.log "VoF"
      else if @value == "Escriba la respuesta"
        console.log "Escriba"

  init: ->
    $(document).on "change", ".question_kinds_fields select", @changed
    @trigger()

  trigger: ->
    $(".question_kinds_fields select").trigger "change"

window.Helpers.EvaluacionesPreguntaKindHelper.init()
$(document).on "nested:fieldAdded", (e) ->
  window.Helpers.EvaluacionesPreguntaKindHelper.trigger()
