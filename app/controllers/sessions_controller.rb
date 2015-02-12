class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end


  def create
    user = User.find_by_credentials(params[:session][:email], params[:session][:password])
    if user
      sign_in(user)

      redirect_to user_url(user)

    else
      render :new
    end
  end

  def destroy
    user = current_user
    user.reset_session_token!
    session[:token] = nil

    redirect_to new_session_url
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
