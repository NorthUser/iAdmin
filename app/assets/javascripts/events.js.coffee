# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
	$("#subir").click ->
		files = document.getElementById "file"
		array = []
		for i in [0..files.files.length - 1 ] by 1
			array.push files
		id = $("#id").val()
		upload(files, id)

	$(".participant_config").click ->
		$("#doc_id").val($(this).val())
		getUsers()
		getPaticipantType()
		$("#modal_doc").modal('show')

	$("#add_participant").click ->
		addParticipante()

	$("#file_").change ->
		len = $("#file_").get(0).files.length
		string = ""
		for x in [0...len]
			string += "<input type='text' name='titulos[]' class='form-control' required='required' placeholder='Titulo'><label>"+$("#file_").get(0).files[x].name+"</label>"
		$("#titulos").html(string)

getUsers = ->
	$.ajax "/events/list_users",
	type: "post"
	dataType: "json"
	error: (jqXHR, textStatus, errorThrown) ->
		alert "AJAX Error: " + textStatus
	success: (data, textStatus, jqXHR) ->
		setDropdownMenu("#lstusr", data)

getPaticipantType = ->
	$.ajax "/events/list_participant_type",
	type: "post"
	dataType: "json"
	async: true
	error: (jqXHR, textStatus, errorThrown) ->
		alert "AJAX Error: " + textStatus
	success: (data, textStatus, jqXHR) ->
		setDropdownMenu("#lstroles", data)

addParticipant = ->
	data =
		doc_id:$("#doc_id").val()
		user_id:$("#lstusr").val()
	$.ajax "/events/participants",
	data:data
	type: "post"
	dataType: "json"
	async: true
	error: (jqXHR, textStatus, errorThrown) ->
		alert "AJAX Error: " + textStatus
	success: (data, textStatus, jqXHR) ->
		setTableBody("#table-body", data.users)
		setDropdownMenu(".participants", data.participants)

setDropdownMenu = (dropdown, data) ->
	array = []
	for d in data
		array.push "<option value='"+d.id+"'>"+d.full_name+"</option>"
	$(dropdown).html(array.join('<br>'))

setTableBody = (tbody, users) ->
	array = []
	for user in users
		array.push "<tr><td>"+user.id+"</td><td>"+user.full_name+"</td><td><select class'participants'></select></td></tr>"
	$(dropdown).html(array.join(''))

addParticipante = ->
	data =
		roles:$("#lstroles").val()
		user:$("#lstusr").val()
		event:$("#id_event").val()
	$.ajax "/events/addParticipante",
	type: "post"
	data:data
	dataType: "json"
	error: (jqXHR, textStatus, errorThrown) ->
		alert "AJAX Error: " + textStatus
	success: (data, textStatus, jqXHR) ->
		if data.success
			window.location.reload()



upload = (array, number)->
	data = new FormData()
	data.append('files', array.files)
	data.append('id', number)

	$.ajax "/events/upload.json",
	type: "post"
	data:data
	dataType: "json"
	contentType:false
	processData:false
	cache:false
	error: (jqXHR, textStatus, errorThrown) ->
		alert "AJAX Error: " + textStatus
	success: (data, textStatus, jqXHR) ->
		alert data.tamanio
