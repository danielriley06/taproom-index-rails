class ReviewDatatable < AjaxDatatablesRails::Base

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(Association.brewery.name)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(Association.review.ambiance)
  end

  private

  def data
    records.map do |record|
      [
        record.user.email,
        record.review.ambiance,
        record.review.service,
        record.review.selection,
        record.review.food,
        record.review.value,
        record.review.description
      ]
    end
  end

  def get_raw_records
    Association.where(brewery_id: params[:id])
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
