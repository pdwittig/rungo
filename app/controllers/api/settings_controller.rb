class Api::SettingsController < ApplicationController
  
  def show
    @settings = AuthToken.find_by_access_token(params[:auth_token]).user.setting
    render json: @settings.to_json(include: :agency)
  end

  def update
    @agency = Agency.find_by_name(params[:agency_name])
    @settings = AuthToken.find_by_access_token(params[:auth_token]).user.setting
    @settings.update_attributes agency: @agency
    render json: @settings.to_json(include: :agency)
  end

end