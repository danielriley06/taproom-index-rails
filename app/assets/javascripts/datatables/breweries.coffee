# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->

  $('#breweries-table').dataTable
    pagingType: 'full_numbers'
    ordering: false
    processing: true
    serverSide: true
    autoWidth: false
    ajax: $('#breweries-table').data('source')

  $('#brewery-beer-table').dataTable
    pagingType: 'full_numbers'
    processing: true
    serverSide: true
    autoWidth: false
    ajax: $('#brewery-beer-table').data('source')

  $('#brewery-review-table').dataTable
    pagingType: 'full_numbers'
    processing: true
    serverSide: true
    autoWidth: false
    ajax: $('#brewery-review-table').data('source')
