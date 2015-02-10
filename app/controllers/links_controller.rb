class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    Link.create(link_params)
    flash[:notice] = 'Link was successfully created'
    redirect_to links_path
  end

  private

    def link_params
      params.require(:link).permit(:url)
    end
end
