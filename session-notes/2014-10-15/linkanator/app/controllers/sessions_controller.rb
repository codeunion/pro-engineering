class SessionsController < ApplicationController
  before_action :redirect_if_logged_in!, only: [:create]

  def create
    user = User.find_by_email(session_params[:email])

    if user && user.authenticate(session_params[:password])
      login!(user)
      redirect_to :back
    else
      redirect_to :back, error: 'Invalid email or password.'
    end
  end

  def destroy
    logout! if logged_in?

    redirect_to :back
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
