module SessionsHelper

  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end
  
  def sign_out
    cookies.delete(:remeber_token)
    self.current_user = nil
  end
  
  def current_user
    @current_user = user ||= user_from_remember_token
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  private
  
    def user_from_remember_token
      User.authenticate_with_salt(*remeber_token)
    end
  
    def remeber_token
      cookie.signed[:remember_token] || [nil, nil]
    end
end
