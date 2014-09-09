class Api::SettingsController < ApplicationController
  
  def show
    p params
    @settings = AuthToken.find_by_access_token(params[:auth_token]).user.setting
    p @settings.to_json(include: [:agency, :non_directional_route])
    render json: @settings.to_json(include: [:agency, :non_directional_route, :directional_route])
  end

  def update
    agency = Agency.find_by_name(params[:agency_name])
    non_directional_route = NonDirectionalRoute.find_by_name(params[:non_directional_route_name])
    directional_route = DirectionalRoute.find_by_name(params[:directional_route_name])
    @settings = AuthToken.find_by_access_token(params[:auth_token]).user.setting
    @settings.update_attributes(agency: agency,
      non_directional_route: non_directional_route,
      directional_route: directional_route) 
    render json: @settings.to_json(include: [:agency, :non_directional_route])
  end

end