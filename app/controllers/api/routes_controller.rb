class Api::RoutesController < ApplicationController
  before_action :set_route_type

  def index
    @routes = get_routes
    render json: @routes.to_json
  end

  private

  def get_routes
    p route_type
    p params

    if params[:type] == "NonDirectionalRoutes"
      agency_id = Agency.find_by_name(params[:agency_name])
      route_class.where(agency_id: agency_id)
    elsif params[:type] == "DirectionalRoutes"
      route_id = Route.find_by_name(params[:non_directional_route_name])
      route_class.where(non_directional_route_id: route_id)
    end
  end

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