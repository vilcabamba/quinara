window.Helpers ||= {}

window.Helpers.AnswersDroppableHelper =
  init: ->
    $(".draggable").draggable revert: "invalid"
    $(".droppable").droppable
      drop: (e, ui) ->
        $(this).append ui.draggable.css(left: 0, top: 0, right: 0, bottom: 0)

    $(".droppable_answer").droppable
      accept: ->
        $(this).find(".draggable").length == 0

      drop: (e, ui) ->
        $this = $(this)
        $this.find("input").val ui.draggable.text()
        console.log "updating value of input"
        $this.append ui.draggable.css(left: 0, top: 0, right: 0, bottom: 0)
