jQuery ->

  $('#breweries-table').dataTable
    pagingType: 'full_numbers'
    processing: true
    serverSide: true
    autoWidth: false
    ajax: $('#breweries-table').data('source')
