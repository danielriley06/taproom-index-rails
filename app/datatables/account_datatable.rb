class AccountDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :h, :mailto, :edit_resource_path, :resource_url, :other_method, :brewery_path

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(Association.brewery.type)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(Association.brewery.name Association.brewery.city Association.brewery.state Association.brewery.brewery_type)
  end

  private

  def data
    records.map do |record|
      [
        record.brewery.name,
        record.brewery.city,
        record.brewery.state,
        record.date_visited,
        link_to("Info", brewery_path(:id => record.brewery_id), class: 'btn btn-block btn-success')
      ]
    end
  end

  def get_raw_records
    Association.where(user_id: params[:id])
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
