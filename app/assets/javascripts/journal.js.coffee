jQuery ->
  $('#new_journal').fileupload
    dataType: 'script'
    add: (e, data) ->
      data.context = $(tmpl('template-upload', data.files[0]))
      $('#new_journal').append(data.context)
      data.submit()
    progress: (e,data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')

