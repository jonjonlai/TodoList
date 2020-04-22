class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        print @user
        if @user.save
            login(@user)
            redirect_to todos_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end



    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
