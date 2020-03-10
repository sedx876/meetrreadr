class UserSessionsController < ApplicationController


  def new
  end

  def create
    if request.env["omniauth.auth"]
        @user = User.find_by(github_uid: request.env["omniauth.auth"]["uid"])
        if @user.nil?
            @user = User.create(username: request.env["omniauth.auth"]["info"]["nickname"], github_uid: request.env["omniauth.auth"]["uid"], password: "github")
        end
        log_in(@user)
        redirect_to books_path
    else
        @user = User.find_by(username: params[:username])
        if !@user
            #@error = "Account not found. Please try again."
            render :new
        elsif !@user.authenticate(params[:password])
            #@error = "Password incorrect. Please try again."
            render :new
        else
            log_in(@user)
            redirect_to books_path
        end
    end
end

  # def create
  #   @user = User.find_by(username: params[:username])
  #     if @user && @user.authenticate(params[:password])
  #       session[:user_id] = @user.id
  #       redirect_to books_path
  #     else
  #       render :new
  #     end
  # end

  def destroy
    session.clear
    redirect_to root_path
  end
  
end
