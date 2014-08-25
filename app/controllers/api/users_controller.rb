class Api::UsersController < ApplicationController
  
  def create
    @user = User.new(email: params[:email])
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    if @user.save
      render status: 200, json: { status: 'ok' }
    else
      render status: 400, json: { status: 'error' }
    end
  end

end