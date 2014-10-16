class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user = current_user

    if @link.save
      redirect_to root_url, :notice => 'Link was successfully created.'
    else
      render :new
    end
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(banana_params)
      redirect_to @link, "notice" => 'Link was successfully updated.'
    else
      render :edit
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def link_params
    params.require(:link).permit(:title, :url)
  end
end
