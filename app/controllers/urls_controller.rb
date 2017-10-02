class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.add_short_url
    if @url.save
      redirect_to urls_path
    else
      @errors = @url.errors
      render "urls/new"
    end
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end
end
