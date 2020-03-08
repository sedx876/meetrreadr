class UsersController < ApplicationController
  has_many :books
    def new 
      @user = User.new
    end

    

    def create
        @user = User.new(user_params)
        if @user.save
            log_in(@user)
            redirect_to books_path
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :book_id)
    end
end
