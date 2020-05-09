class SessionsController < ApplicationController
  def new
  	@session = Session.new
  end

  def create
	 #On cherche s'il existe un utilisateur dans la BD
	 User.find_by(email: params[:email])

	 #on vérifie si l'utilisateur existe bien ET si on arrive 
	 #à l'authentifier (méthode bcrypt) avec le mot de passe 
	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    # redirige où tu veux, avec un flash ou pas
	  else
	    flash.now[:danger] = 'Invalid email/password combination'
	    render 'new'
	  end
  end

  def destroy

  end
end
