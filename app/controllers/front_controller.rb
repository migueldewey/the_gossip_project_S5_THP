class FrontController < ApplicationController
  def team
  end

  def contact
  end

  def welcome
  	puts "$"*60
  	#@first_name = "Miguel"
  	@first_name = params[:first_name]
  	puts "l'utilisateur a tapé #{@first_name}"
  	puts "$"*60
  end

end

#def gossips
#     gossips = Gossip.all
#    @id = 1
#    @author = "Titre du potin"
#   @title = "Titre du potin"
#   @content = "content"
# end

  # View a gossip
#  def gossip
#     gossip = Gossip.find(params['id'])
#   @author = "Author du potin"
#   @title = "Titre du potin"
#   @content = "content"
#end