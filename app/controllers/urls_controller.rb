class UrlsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_url, only: :show
  before_action :set_own_url, only: [:destroy]


  def index
    @urls = Url.all.includes(:user)
  end

  def new
    @url = Url.new

  end

  def create
    @url = Url.new(url_params)
    @url.user = current_user

    @short = SecureRandom.base64(6)
    create if Url.exists?(short_url: @short)

    @url.short_url= @short
    if @url.save
      redirect_to urls_path
    else
      render :new
    end
  end

  def destroy
    if @url.destroy
      redirect_to urls_path
    end
  end

  def url_params
    params.require(:url).permit(:description, :long_url)
  end

  def set_own_url
    @url= current_user.urls.find_by_id(params[:id])
    if @url.nil?
      flash[:alert] = 'this post is either does not belong to you or does not exist'
      redirect_to urls_path
    end
  end

  def set_url
    @url = Url.find(params[:id])
  end


end
