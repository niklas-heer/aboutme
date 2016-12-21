#### Scrolling Text
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

#### Popover
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

#### Footer (Easter Egg)
$("footer .love").hover ->
  $FooterName = $("footer .name")
  if $FooterName.hasClass('active')
    $FooterName.removeClass('active')
  else
    $FooterName.addClass('active')

$("footer .name").hover ->
  $FooterName = $("footer .love")
  if $FooterName.hasClass('active')
    $FooterName.removeClass('active')
  else
    $FooterName.addClass('active')

#### Modal
$("body").click (event) ->
  container = $(".modal")
  container.closest(".modal-wrap").addClass "closed"  if not container.is(event.target) and container.has(event.target).length is 0

$(".open-modal").click (event) ->
  event.preventDefault()
  event.stopPropagation()
  console.log ($($(this).attr("href"))) 
  $($(this).attr("href")).removeClass "closed"

popModal = (id) ->
  console.log(id + ".modal-wrap")
  $("#"+id).removeClass "closed"

hash = window.location.hash

popModal(hash.substring(1))
