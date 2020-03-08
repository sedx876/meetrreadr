class ApplicationController < ActionController::Base

    def current_user
       @current_user ||= User.find_by(id: session[:user_id])
    end

    def require_login
        redirect_to root_path unless logged_in?
    end

    def logged_in?
        !!current_user
    end

    def log_in(user)
        session[:user_id] = user.id
    end

    # def authentication_required
    #     if !logged_in?
    #         redirect_to login_path
    #     end
    # end
end
