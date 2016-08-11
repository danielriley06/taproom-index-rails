class ReviewDatatable < AjaxDatatablesRails::Base

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= [
      'Review.ambiance',
      'Review.service',
      'Review.selection',
      'Review.food',
      'Review.value',
      'Review.description'
    ]
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= [
      'Review.ambiance',
      'Review.service',
      'Review.selection',
      'Review.food',
      'Review.value',
      'Review.description'
    ]
  end

  private

  def data
    records.map do |record|
      [
        record.ambiance,
        record.service,
        record.selection,
        record.food,
        record.value,
        record.description
      ]
    end
  end

  def get_raw_records
  Brewery.includes(:reviews).references(:reviews)
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
