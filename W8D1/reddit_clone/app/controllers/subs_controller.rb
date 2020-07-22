class SubsController < ApplicationController
    before_action :require_logged_in, only: [:create, :destroy, :edit, :update, :new]

    def new
      @sub = Sub.new
      render :new
    end

    def index 
        @subs = Sub.all 
        render :index
    end
    
    def show 
        @sub = Sub.find_by(id: params[:id])
        render :show
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.user_id = current_user.id
        if @sub.save
            redirect_to user_url(@sub.user_id)
        else
            flash[:errors] = @sub.errors.full_messages
            redirect_to user_url(@sub.user_id)
        end
    end

    def destroy 
        @sub = current_user.subs.find_by(id: params[:id])
        if @sub 
            @sub.destroy 
            redirect_to user_url(current_user.id)
        end
    end

    def edit
      @sub = current_user.subs.find_by(id: params[:id])

      render :edit
    end

    def update 
      @sub = current_user.subs.find_by(id: params[:id])
      if @sub.update(sub_params)
          redirect_to sub_url(@sub)
      else
          flash[:errors] = @sub.errors.full_messages
          render :edit
      end
    end

    private
    def sub_params 
        params.require(:sub).permit(:description, :title)
    end
end