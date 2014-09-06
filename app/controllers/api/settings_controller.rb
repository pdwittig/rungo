class Api::SettingsController < ApplicationController
  
  def index
    @settings = User.find(params[:user_id]).setting
    render json: @settings
  end

end