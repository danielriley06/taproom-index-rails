class ReviewDatatable < AjaxDatatablesRails::Base

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(User.username)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(Association.review.ambiance)
  end

  private

  def data
    records.map do |record|
      [
        record.user.username,
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
    Review.joins(:brewery, :user).where('brewery_id = ?', params[:id])
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
