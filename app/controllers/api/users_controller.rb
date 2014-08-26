class Api::UsersController < ApplicationController
  
  def create
    @user = User.new(email: params[:email])
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    if @user.save
      render status: 200, json: { status: 'ok' }
    else
      render status: 400, json: { error_message: @user.errors.full_messages.first }
    end
  end

end