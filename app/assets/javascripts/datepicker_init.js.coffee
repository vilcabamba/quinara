init_datepicker = ->
  $datepickers = $(".datepicker:not(.dropdown-menu)")
  if $datepickers.length > 0
    $datepickers.datepicker({
      format: 'yyyy-mm-dd'
    })
  null

jQuery init_datepicker
$(document).on "page:load", init_datepicker
