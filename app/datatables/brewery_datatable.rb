class BreweryDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :h, :mailto, :edit_resource_path, :resource_url, :other_method

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(Brewery.type)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(Brewery.name Brewery.city Brewery.state Brewery.type)
  end

  private

  def data
    records.map do |record|
      [
        record.name,
        record.city,
        record.state,
        record.type,
        link_to("Info", record, :class => 'btn btn-block btn-success')
      ]
    end
  end

  def get_raw_records
    Brewery.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
