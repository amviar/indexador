class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:email, :password)
    if @user = login(user_params[:email], user_params[:password])
      # TODO: arreglar redirect
      redirect_back_or_to(:users, notice: 'Login exitoso')
    else
      @user = User.new
      flash.now[:alert] = 'Login falló'
      render action: 'new'
    end
  end
end
