class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
   
    before_action :logged_in?

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if @user
            login(@user)
            redirect_to todos_url
        else
            flash.now[:errors] = ["Invalid Credentials"]
            render :new
        end
    end

    def destroy
        logout
        redirect_to new_session_url
    end

end
