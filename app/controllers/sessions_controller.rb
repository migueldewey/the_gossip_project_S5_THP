class SessionsController < ApplicationController
  before_action :authenticate_user, only: [:index]
  #def index
  #	redirect_to show_user_path
  #end

  def new
  	@user = User.new
  end

  def create
	 #On cherche s'il existe un utilisateur dans la BD
	 @user = User.find_by(email: params[:email])

	 #on vérifie si l'utilisateur existe bien ET si on arrive 
	 #à l'authentifier (méthode bcrypt) avec le mot de passe 
	  if @user && @user.authenticate(params[:password])
	    session[:user_id] = @user.id
	    redirect_to user_path(@user.id)
	    # redirige où tu veux, avec un flash ou pas
	  else
	    flash.now[:danger] = 'Invalid email/password combination'
	    render :new
	  end
  end

  def destroy
	session.delete(:user_id)
    redirect_to :root
  end

  private

  def authenticate_user
	    unless current_user
	      flash[:danger] = "Please log in."
	      redirect_to new_session_path
	    end
	end

end
