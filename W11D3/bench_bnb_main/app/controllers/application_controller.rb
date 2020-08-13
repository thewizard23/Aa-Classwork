class ApplicationController < ActionController::Base

    # Crlll
    helper_method :current_user, :logged_in?
    
    def current_user
        @current_user ||= current_user.
    end

    def require_logged_in

    end

    def login!

    end

    def logged_in?
        !!current_user
    end

    def logout

    end
end
