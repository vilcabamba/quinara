window.Helpers ||= {}

window.Helpers.FormsHelper = {
  setFieldsWithErrors: ($el) ->
    $fields_with_errors = $el.find(".field_with_errors")
    $fields_with_errors.addClass("control-group error")
    for label in $fields_with_errors.find("label")
      $label = $(label)
      $label.parent().next().prepend($label)
    # $fields_with_errors.parent().find(".help-inline").each ->
    #   $(this).show().parent().find(".field_with_errors").last().append this
    null
  setDivsOnLabels: ($el) ->
    for node in $el.find("label")
      unless $(node).hasClass("no_controls")
        $(node).addClass("control-label")
    null
  setFormClasses: ->
    for form in $("form")
      $form = $(form)
      unless $form.hasClass("no_format")
        $form.addClass("form-horizontal")
          .find(".field").addClass("control-group")
        @setDivsOnLabels $form
        @wrapInputs $form
        @setFieldsWithErrors $form
    null
  wrapInputs: ($el) ->
    for node in $el.find("form input, form textarea, form select")
      $this = $(node)
      if not $this.hasClass("no_controls") and not $this.parent().hasClass("controls")
        $this.wrap("<div class='controls' />")
    null
  init: ->
    @setFormClasses()
    null
}

jQuery ->
  window.Helpers.FormsHelper.init()
$(document).on "page:load", ->
  window.Helpers.FormsHelper.init()

$(document).on "nested:fieldAdded", (e) ->
  # this field was just inserted into your form
  # var field = event.field
  # it's a jQuery object already! Now you can find date input
  # var dateField = field.find('.date');
  # and activate datepicker on it
  # dateField.datepicker()
  window.Helpers.FormsHelper.init()
