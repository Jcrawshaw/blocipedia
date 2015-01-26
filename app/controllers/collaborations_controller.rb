class CollaborationsController < ApplicationController

  def index
    @users = User.all
    @wiki = Wiki.find(params[:wiki_id])
    @collaborators = @wiki.collaborators
  end

  def new
  end

  def create
    @wiki = Wiki.find params[:wiki_id]
    @user = User.find params[:user_id]
    @wiki.collaborations.create user: @user
    flash[:notice] = "Collaborator Added" 
    redirect_to action: :index
  end

  def destroy
    @wiki = Wiki.find params[:wiki_id]
     
    if @wiki.collaborations.destroy 
      flash[:notice] = "Collaborator removed"
    else
      flash[:error] = "Collaborator could not be removed"
    end
    redirect_to action: :index
  end
 
  
end