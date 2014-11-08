selector = ".evaluacion-formatos-count-js"

formatos_count_helper =
  changedFormatosCount: (e) ->
    count = parseInt e.target.value, 10
    # old implementation
    # $(".formato_evaluaciones .evaluacion-row").hide()
    # for i in [1..count]
    #   $(".formato_evaluaciones .evaluacion-row-#{i}").show()

    # let's toggle evaluacion 2
    if count == 2
      $(".evaluacion-row-2").hide()
    else
      $(".evaluacion-row-2").show()

  init: ->
    $(selector).find("select").on "change", @changedFormatosCount
    $(selector).find("select").trigger "change"

initialize = ->
  if $(selector).length > 0
    formatos_count_helper.init()

jQuery initialize
$(document).on "page:load", initialize
