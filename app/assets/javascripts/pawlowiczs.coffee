# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.vote_link').on 'click', (e) ->
    e.preventDefault()
    link = $(this).attr('href')
    positive = if $(this).hasClass('red') then false else true
    $.ajax {
      type: 'POST',
      url: link,
      data: { positive: positive },
      success: (msg) ->
      ,
      error: (x, t, e) ->
        alert x.responseJSON.error
    }
  $("#pawlowicz").animate {
    width: "500px"
  }, 15000, ->
