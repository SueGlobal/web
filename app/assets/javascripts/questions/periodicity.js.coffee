jQuery ->
  $periodicity = $('fieldset.periodicity')
  $other = $periodicity.find('div.other')
  $other.hide()

  $periodicity.find('select[name="student_study[study_periodicity_question_attributes][periodicity]"]').on 'change', (evt) ->
    $other.hide()
    value = $(this).children('option:selected').val()
    if value is 'other'
      $other.show()
