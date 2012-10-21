jQuery ->
  $detailedInfo = $('fieldset.sampling > fieldset.detailed_information')
  $detailedInfo.hide()
  $probabilistic = $detailedInfo.find('.probabilistic_sampling')
  $nonProbabilistic = $detailedInfo.find('.non_probabilistic_sampling')
  $('input[name="sampling_option"]').on 'change', (event) ->
    $detailedInfo.hide()
    $probabilistic.hide()
    $nonProbabilistic.hide()
    value = $(this).attr('value')
    if value is 'probabilistic'
      $detailedInfo.show()
      $probabilistic.show()
    else if value is "non_probabilistic"
      $detailedInfo.show()
      $nonProbabilistic.show()
