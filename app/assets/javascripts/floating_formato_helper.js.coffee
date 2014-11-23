window.Helpers ||= {}

window.Helpers.FloatingFormato =
  init: ->
    $("form").on "change", "input, select", (e) ->
      $form = $("form")
      url = $form.attr "action"
      $.post "#{url}/validate", $form.serialize(), "script"
      true

    $(document).on "nested:fieldRemoved", ->
      # let's trigger upon fields removal
      $("form input:first").trigger "change"
