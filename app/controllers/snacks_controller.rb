class SnacksController < ApplicationController
  # GET /snacks
  # GET /snacks.json
  def index
  end

  # the endpoint
  def pdf_metadata
    # accepts the urls[] parameter
    # a comma delimited string
    # unwrapped into an array
    @urls = snack_params[:urls][0].split(',')
  end

  private
    # parameters whitelist
    def snack_params
      params.permit(urls: [])
    end
  #/private
end
