class UserController < ApplicationController
  def index
 @gossips = Gossip.all.order("created_at DESC")
  end

  def new
  	@user =   User.new(
        first_name: "",
        last_name: "",
        description: "",
        email: "",
        password: "",
        age: "",
        city: City.last)
  end

  def create
	user = User.new(
        first_name: params[:first_name],
        last_name: params[:last_name],
        description: params[:description],
        email: params[:email],
        age: params[:age],
        city: City.find(params[:city]),
        password: params[:password] #password bcrypt
    )
    password_confirmation = Bcrypt::Password.new(params[:password_confirmation])
    if user.save && password == password_confirmation
      flash[:success] = "Votre compte a bien été créé !"
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
