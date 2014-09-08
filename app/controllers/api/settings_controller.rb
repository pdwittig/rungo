class Api::SettingsController < ApplicationController
  
  def index
    @settings = AuthToken.find_by_access_token(params[:auth_token]).user.setting
    render json: @settings.to_json(include: :agency)
  end

end