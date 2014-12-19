window.Helpers ||= {}

# flag: do not validate several times at once
posting = false

window.Helpers.FloatingFormato =
  triggerChange: ->
    $("form input:first").trigger "change"

  init: ->
    $("form").on "change", "input, select", (e) ->
      return if posting
      $form = $("form")
      url = $form.attr "action"
      posting = true
      $.post "#{url}/validate", $form.serialize(), (-> posting = false), "script"
      true

    $(document).on "nested:fieldRemoved", @triggerChange
