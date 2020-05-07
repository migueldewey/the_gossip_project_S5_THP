class GossipController < ApplicationController
  def new
  	 @gossip = Gossip.new(title: "", content: "", user: User.last)
  end

  def create
	  	puts params
	    @gossip = Gossip.new(title: params[:title],
                         content: params[:content],
                         user: User.find(params[:user]))
    	# @gossip = Gossip.new(params[:post])
	    if @gossip.save # essaie de sauvegarder en base @gossip
	    	redirect_to gossip_index_path # si ça marche, il redirige vers la page d'index du site
	  else
	    	render 'new'# sinon, il render la view new (qui est celle sur laquelle on est déjà)
	  end
  end

   # View list of gossips (order most recents first)
  def index
    @gossips = Gossip.all.order("created_at DESC")
  end

  # View a gossip
  def show
    @gossip = Gossip.find(params[:id])
  end


  # Display a view with a form to edit an existing gossip
  def edit

  end

  # Edit an existing gossip
  def update

  end

  # Delete a gossip
  def destroy
    Gossip.find(params[:id]).delete
    redirect_to gossip_index_path
  end
end
