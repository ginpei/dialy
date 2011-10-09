# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

getSelectedDate = ->
  new Date([
    $('#page_date_1i').val()
    $('#page_date_2i').val()
    $('#page_date_3i').val()
  ].join '/')

initEdit = ->
  yesterday = new Date(getSelectedDate() - (1000 * 60 * 60 * 24))

  console.log yesterday

  $.getJSON '/dialy/pages/4.json', (data, statusText) ->
    console.log data.cash, data.suica

$ ->
  initEdit()
