class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    render :show
  end

  def new
    @user = User.new
    render :new

  end

  def create
    @user = User.new(user_params)
    @user.password=(params[:user][:password])
    @user.activation_token = SecureRandom::urlsafe_base64
    @user.activated = false
    if @user.save
      msg = UserMailer.welcome_email(@user)
      msg.deliver
      redirect_to user_url(@user)
    else
      render :new
    end

  end

  def activate
    @user = User.find(params[:user_id])
    #if @user.activation_token == params[:activation_token]
      @user.activated = true
      sign_in(@user)
      redirect_to user_url(@user)
  #  end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password_digest)
  end

end
