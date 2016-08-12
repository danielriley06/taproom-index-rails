class AccountsController < ApplicationController
  before_action :set_brewery, only: [:show]

  def show
    respond_to do |format|
      format.html
      format.json { render json: ReviewDatatable.new(view_context) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brewery
      @brewery = Brewery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brewery_params
      params.require(:brewery).permit(:name, :city, :country, :postal_code, :state, :telephone, :brewery_type, :has_pub)
    end
  end
