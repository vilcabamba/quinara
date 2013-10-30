window.Helpers ||= {}

window.Helpers.FormsHelper = {
  setFieldsWithErrors: ->
    $fields_with_errors = $(".field_with_errors")
    $fields_with_errors.addClass("control-group error")
    for label in $fields_with_errors.find("label")
      $label = $(label)
      $label.parent().next().prepend($label)
    # $fields_with_errors.parent().find(".help-inline").each ->
    #   $(this).show().parent().find(".field_with_errors").last().append this
    null
  setDivsOnLabels: ->
    $("label").addClass("control-label")
    null
  setFormClasses: ->
    $("form").addClass("form-horizontal")
      .find(".field").addClass("control-group")
    null
  wrapInputs: ->
    for node in $("form input, form textarea, form select")
      $this = $(node)
      if not $this.hasClass("no_controls") and not $this.parent().hasClass("controls")
        $this.wrap("<div class='controls' />")
    null
  init: ->
    @setDivsOnLabels()
    @setFormClasses()
    @wrapInputs()
    @setFieldsWithErrors()
    null
}

jQuery ->
  window.Helpers.FormsHelper.init()

$(document).on "nested:fieldAdded", (e) ->
  # this field was just inserted into your form
  # var field = event.field
  # it's a jQuery object already! Now you can find date input
  # var dateField = field.find('.date');
  # and activate datepicker on it
  # dateField.datepicker()
  window.Helpers.FormsHelper.init()
