current = 1 #keeps track of the current div
height = $(".roles").height() #the height of the roles div
numberDivs = $(".roles").children().length #the number of children of the roles div
first = $(".roles div:nth-child(1)") #the first div nested in roles div
setInterval (->
  number = current * -height
  first.css "margin-top", number + "px"
  if current is numberDivs
    first.css "margin-top", "0px"
    current = 1
  else
    current++
), 2000

$(".dots-container, .popover-content").click (e) ->
  e.stopPropagation()
  $popover = $("#popover")
  if not $popover.hasClass('active')
    $popover.fadeIn()
    $popover.addClass('active')
  else
    $popover.fadeOut()
    $popover.removeClass('active')

$(document).click ->
  $popover = $("#popover")
  $popover.fadeOut()
