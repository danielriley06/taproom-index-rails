jQuery ->

  $('#accounts-table').dataTable
    pagingType: 'full_numbers'
    processing: true
    serverSide: true
    autoWidth: false
    ordering: false
    ajax: $('#accounts-table').data('source')
