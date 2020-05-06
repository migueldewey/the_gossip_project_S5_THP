class FrontController < ApplicationController
  def team
  end

  def contact
  end

  def welcome
  	puts "$"*60
  	@first_name = "Miguel"
  	#@first_name = params[':first_name']
  	puts "l'utilisateur a tapé #{@first_name}"
  	puts "$"*60
  end
end
