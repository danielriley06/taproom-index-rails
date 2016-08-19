class AccountDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :link_to_if, :h, :mailto, :edit_resource_path, :resource_url, :other_method, :content_tag, :concat, :brewery_path, :new_brewery_review_path, :edit_brewery_review_path

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
        content_tag(:div) do
          concat(link_to("Info", brewery_path(:id => record.brewery_id), class: 'btn btn-success'))
          concat("   ")
          concat(link_to("Review", edit_brewery_review_path(:brewery_id => record.brewery_id, :id => record.id), class:
          'btn btn-danger'))

        end
      ]
    end
  end

  def get_raw_records
    Review.joins(:user, :brewery)
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
