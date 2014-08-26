class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if @user
      @user.create_ApiKey
      render status: 200, json: @user.to_json(only: :email, include: :ApiKey)
    else
      render status: 400, json: { error_message: "wrong email or password" }
    end
  end

  def destroy
    #Todo
  end

end