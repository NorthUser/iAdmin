# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
	$(".lstpermissions").click ->
		$('#profile_permissions').val(string_permisos())

string_permisos = ->
  keys = []
  $(".lstpermissions").each (index)->
    if $(this).is(":checked")
      keys.push $(this).val()
  (if (keys.length > 0) then keys.join("|") else "")
