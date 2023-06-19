class PhotosController < ApplicationController
  before_action :authenticate_user

  
  def index
    @photos =Photo.all
  end
  
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      PhotoMailer.post_email(@photo).deliver
      redirect_to photos_path #index
    else
      render new
    end
  end

  def confirm
    @photo = Photo.new(photo_params)
  end

  def show
    @photo = Photo.find(params[:id])
    @favorite = current_user.favorites.find_by(photo_id: @photo.id)
  end

  def edit
    @photo = Photo.find(params[:id])
    unless @photo.user == current_user
      redirect_to photos_path
    end
  end
  
  def update
    @photo = Photo.find(params[:id])
    if @photo.user != current_user
      redirect_to photos_path
    else
      if @photo.update(photo_params)
        redirect_to photos_path,notice: "更新しました"
      else
      render :new
      end
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.user != current_user
      redirect_to photos_path
    else
    @photo.destroy
    redirect_to photos_path
    end
  end

  private
  
  def photo_params
    params.require(:photo).permit(:content, :image, :image_cache)
  end

  def authenticate_user
    unless log_in?
      redirect_to new_session_path
    end
  end
end
