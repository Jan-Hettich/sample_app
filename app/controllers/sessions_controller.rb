class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email])
    if user.nil?
      flash.now[:error] = "Invalid email."
      @title = "Sign in"
      render 'new'
    else
      # sign in the user and redirect to user's show page
    end
  end

  def destroy
  end

end
