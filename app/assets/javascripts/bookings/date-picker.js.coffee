$ ->
  $('#from').datepicker
    defaultDate: '+1w'
    changeMonth: true
    numberOfMonths: 1
    onClose: (selectedDate) ->
      $('#to').datepicker 'option', 'minDate', selectedDate

  $('#to').datepicker
    defaultDate: '+1w'
    changeMonth: true
    numberOfMonths: 1
    onClose: (selectedDate) ->
      $('#from').datepicker 'option', 'maxDate', selectedDate

