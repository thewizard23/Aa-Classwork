class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if user #session = user.reset_session_token
            login!(user)
            redirect_to cats_url
        else
            render :new
        end
    end

    def destroy
        if logged_in?
            current_user.reset_session_token
            logout!
        end
        redirect_to new_url
    end
end
