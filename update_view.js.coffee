updateView =
  init: (el, object, objectName)->
    @el = el
    @object = object
    @objectName = objectName

    @updateText()
    @updateEnable()
    @updateShow()
    @updateHide()
    
  updateText: ->
    $.each @object, (key, value) =>
      field = $(@el).find("[value_binding='#{@objectName}-#{key}']")
      if value != ""
        text = value
        field.text(value)
      else
        text = field.attr("bind-no-value") or ""
      if field.is(":input")
        field.val(text)
      else
        field.text(text)
  updateEnable: ->
    $.each @object, (key, value) =>
      field = $(@el).find("[enabled_binding='#{@objectName}-#{key}']")
      if value
        field.enabled()
      else
        field.disabled()
  updateShow: ->
    $.each @object, (key, value) =>
      field = $(@el).find("[show_binding='#{@objectName}-#{key}']")
      if value
        field.removeClass("hidden")
      else
        field.addClass("hidden")
  updateHide: ->
    $.each @object, (key, value) =>
      field = $(@el).find("[hide_binding='#{@objectName}-#{key}']")
      if value
        field.addClass("hidden")
      else
        field.removeClass("hidden")

$.fn.updateView = (object, objectName)->
  @each ->
    updateView.init($(this), object, objectName)