class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :destroy]
  	# View list of comments (order most recents first)
    def index
      @comments = Comment.all.order("created_at DESC")
    end

    # View a comment
    def show
      @comment = Comment.find(params[:id])
    end

    # Display a view to create a comment
    def new
      @comment = Comment.new
    end

    # Create a new comment
    def create
      @comment = Comment.new(content: params[:content],
                           user: current_user)

      if @comment.save
        flash[:success] = "Le commentaire a été créé avec succès."
        redirect_to gossips_path
      else
        render 'gossips_path'
      end
    end

    # Display a view with a form to edit an existing comment
    def edit
      @comment = Comment.find(params[:id])
    end

    # Edit an existing comment
    def update
      @comment = Comment.find_by(title: params[:title])

      if @comment.update(content: params[:content], user: current_user)
        flash[:success] = "Le commentaire a été mis à jour avec succès."
        redirect_to gossips_path
      else
        render 'edit'
      end
    end

    # Delete a comment
    def destroy
      Gossip.find(params[:id]).delete
      redirect_to gossips_path
    end
  end
end
