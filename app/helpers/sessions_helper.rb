module SessionsHelper

  def sign_in(user)
    session[:token] = user.id
    current_user = user
  end

  def sign_out
    session.delete(:token)
    current_user = nil
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user || User.authenticate_with_token(session[:token])
  end

  def signed_in?
    !current_user.nil?
  end
end
