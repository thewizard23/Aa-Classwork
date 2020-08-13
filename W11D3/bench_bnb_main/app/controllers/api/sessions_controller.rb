class Api::SessionsController < ApplicationController

    def destroy
        @user = current_user
       if @user

       else

       end
    end



end
