window.Helpers ||= {}

window.Helpers.EvaluacionesPreguntaKindHelper =

  showOpcionFieldIn: ($div) ->
    $div.removeClass("hide_opcion_field").addClass "hide_boolean_fields hide_checkbox_field"

  showCheckboxFieldIn: ($div) ->
    $div.removeClass("hide_checkbox_field").addClass "hide_boolean_fields hide_opcion_field"

  showBooleanFieldIn: ($div) ->
    $div.removeClass("hide_boolean_fields").addClass "hide_opcion_field hide_checkbox_field"

  showAddAnswersButtonIn: ($div) ->
    $div.find(".add_respuesta_button").show()

  hideAddAnswersButtonIn: ($div) ->
    $div.find(".add_respuesta_button").hide()

  hideBooleanFieldIn: ($div) ->
    $div.addClass "hide_boolean_fields"

  removeAnswersIn: ($div) ->
    for button in $div.find(".delete_answer_button")
      $(button).trigger "click"

  changed: ->
    self = window.Helpers.EvaluacionesPreguntaKindHelper
    $question_parent = $(this).parent().parent()
    if @value == "Seleccionar una opción" or @value == "Escoja la respuesta"
      self.showAddAnswersButtonIn $question_parent
      self.hideBooleanFieldIn $question_parent
      if @value == "Seleccionar una opción"
        self.showCheckboxFieldIn $question_parent
      else
        self.showOpcionFieldIn $question_parent
    else
      self.removeAnswersIn $question_parent
      self.hideAddAnswersButtonIn $question_parent
      if @value == "Verdadero o Falso"
        self.showBooleanFieldIn $question_parent
      else if @value == "Escriba la respuesta" or @value == "Pregunta oral"
        self.hideBooleanFieldIn $question_parent

  init: ->
    $(document).on "change", ".question_kinds_fields select", @changed
    @trigger()

  trigger: ->
    $(".question_kinds_fields select").trigger "change"

jQuery ->
  window.Helpers.EvaluacionesPreguntaKindHelper.init()

$(document).on "nested:fieldAdded", window.Helpers.EvaluacionesPreguntaKindHelper.trigger
$(document).on "page:load", window.Helpers.EvaluacionesPreguntaKindHelper.trigger
