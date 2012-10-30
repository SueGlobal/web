jQuery ->
  $detailedInfo = $('fieldset.sampling > fieldset.detailed_information')
  $probabilistic = $detailedInfo.find('.probabilistic_sampling')
  $nonProbabilistic = $detailedInfo.find('.non_probabilistic_sampling')
  $noMoreInfoNeeded = $detailedInfo.find('.no_more_info_needed')

  showOrHideInfo = ($select) ->
    $probabilistic.hide()
    $nonProbabilistic.hide()
    $noMoreInfoNeeded.hide()

    value = $select.find(':selected').val()
    if value is 'probabilistic'
      $probabilistic.show()
    else if value is "non_probabilistic"
      $nonProbabilistic.show()
    else
      $noMoreInfoNeeded.show()

  $select = $('fieldset.sampling select')
  showOrHideInfo($select)
  $select.on 'change', (event) ->
    showOrHideInfo($(this))
