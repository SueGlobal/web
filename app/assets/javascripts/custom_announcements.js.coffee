$ ->
  $announcement = $('.announcement.alert')
  $announcement.find('button').on 'click', (evt) ->
    $announcement.alert('close')
    hideAnnouncement($(this).data('announcement'))
