class BeerDatatable < AjaxDatatablesRails::Base
  def_delegator :@view, :link_to

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(Beer.name Beer.style Beer.abv Beer.rate_beer_score)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(Beer.name Beer.style Beer.abv Beer.rate_beer_score)
  end

  private

  def data
    records.map do |record|
      [
        link_to(record.name, record.rate_beer_url, :target => "_blank"),
        record.style,
        record.abv,
        record.rate_beer_score
      ]
    end
  end

  def get_raw_records
    Beer.where('brewery_id = ?', params[:id])
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
