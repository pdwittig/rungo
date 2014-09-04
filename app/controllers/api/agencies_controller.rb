class Api::AgenciesController < ApplicationController

  def index
    @agencies = Agency.all
    render json: @agencies.to_json
  end
end