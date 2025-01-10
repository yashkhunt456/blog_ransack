class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # direct go to user index
      # start_new_session_for @user
      # redirect_to after_authentication_url
      p "================================================="
      UserMailer.with(user: @user).welcome_email.deliver_now
      p "==============================================="
      redirect_to new_session_path, notice: 'Account created successfully! Log In to start'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation)
  end
end
