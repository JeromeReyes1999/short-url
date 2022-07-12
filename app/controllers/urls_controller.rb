class UrlsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_own_url, only: [:edit, :update, :destroy]

  def index
    @urls = Url.includes(:user).page(params[:page]).per(5)
    @page = params[:page] #current page
    @domain = request.base_url
  end

  def redirect
    @short_ext = params[:short_url]
    @url = Url.find_by(short_url: @short_ext)
    if @url.nil? #if 404
      content_not_found
    else
      @url.increment!(:count)
      redirect_to @url.long_url
    end
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.user = current_user
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

  def edit; end

  def update
    #the comment below is my other solution
    #@size = (Url.where("id <= ?", params[:id]).size / 5) + 1
    if @url.update(url_params)
      redirect_to urls_path({:page => @page})
    else
      render :edit
    end
  end

  def show
    if (@url = Url.find_by(id: params[:id])).present?
      @domain = request.base_url
      @url = Url.find(params[:id])
    else
      content_not_found
    end
  end

  def url_params
    params.require(:url).permit(:description, :long_url)
  end


  def set_own_url
    @page= params[:page]
    @url= current_user.urls.find_by(id: params[:id])
    if @url.nil?
      flash[:alert] = 'this url is either does not belong to you or does not exist'
      redirect_to urls_path
    end
  end
end
