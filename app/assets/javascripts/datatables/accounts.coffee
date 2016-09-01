jQuery ->

  $('#accounts-table').dataTable
    pagingType: 'full_numbers'
    processing: true
    serverSide: true
    autoWidth: false
    ordering: false
    "language": {
        "emptyTable":     "Review breweries to track your visits!"
    }
    ajax: $('#accounts-table').data('source')
