window.Helpers ||= {}

window.Helpers.DatetimePickers =

  init: ->
    $(".datetimepicker input").data "format", "dd-MM-yyyy hh:mm"
    $(".datetimepicker").datetimepicker
      language: "es"


jQuery ->
  window.Helpers.DatetimePickers.init()
