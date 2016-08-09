# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->

  table = $('#breweries-table').dataTable
    pagingType: 'full_numbers'
    processing: true
    serverSide: true
    autoWidth: false
    ordering: false
    ajax: $('#breweries-table').data('source')
