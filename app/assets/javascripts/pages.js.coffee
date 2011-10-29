# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

initEdit = ->
  $('select[name^="page[date("]')
    .change (event) ->
      updateDate null
      $.getJSON('/dialy/' + getSelectedDate(), (data, status, xhr) ->
        updateDate data
      )
  $('#yesterday-cash, #yesterday-suica')
    .click (event) ->
      num = Number ($(this).text().match(/\ (\d+)\)$/) || [])[1]
      $(this).parent().children(':input').val num

dateToString = (date)->
  [date.getFullYear(), date.getMonth()+1, date.getDate()].join('-')

getSelectedDate = ->
  today = new Date([
    $('#page_date_1i').val()
    $('#page_date_2i').val()
    $('#page_date_3i').val()
  ].join '-')
  yesterday = new Date(today - 1 * 1000 * 60 * 60 * 24)
  dateToString yesterday

updateDate = (data)->
  setMoney data, 'cash'
  setMoney data, 'suica'

setMoney = (data, name)->
  if data && data.date
    text = "(#{data.date}: #{data[name]||"-"})"
  else
    text = ''
  $("#yesterday-#{name}").text(text)

$ ->
  initEdit()
