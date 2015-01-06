class WikisController < ApplicationController
  def index
    if current_user
      @wikis = current_user.wikis
      @whose = 'My'
    else
      @wikis = Wiki.public_only
      @whose = 'All'
    end
    authorize @wikis
  end

  def all
    @whose = 'All'
    @wikis = Wiki.public_only
    authorize @wikis
    render :index
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.build(params.require(:wiki).permit(:title, :body, :private))
    authorize @wiki
    if @wiki.save
      flash[:notice] = "Wiki entry was saved."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the entry. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    if @wiki.update_attributes(params.require(:wiki).permit(:title, :body))
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    @wiki.destroy
    redirect_to action: :index
  end
end
