class Api::RoutesController < ApplicationController
  before_action :set_route_type

  def index
    render json: route_class.all.to_json
  end

  private

  def set_route_type
    @route_type = route_type
  end

  def route_type
    Route.types.include?(params[:type]) ? params[:type] : "Route"
  end

  def route_class
    route_type.constantize
  end
end