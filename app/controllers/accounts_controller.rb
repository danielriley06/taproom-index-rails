class AccountsController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!

  # GET /breweries
  # GET /breweries.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: AccountDatatable.new(view_context) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:name, :city, :country, :postal_code, :state, :telephone, :brewery_type, :has_pub, :user_id)
    end
  end
