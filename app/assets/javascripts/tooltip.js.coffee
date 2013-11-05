window.Helpers.Tooltip =
  init: ->
    $(".ttip").tooltip()

jQuery window.Helpers.Tooltip.init
$(document).on "page:load", window.Helpers.Tooltip.init
$(document).on "nested:fieldAdded", window.Helpers.Tooltip.init
