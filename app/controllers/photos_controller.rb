class PhotosController < ApplicationController
  def index
    @photos =Photo.all
  end
  
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_path #index
    else
      render new
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end
  
  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to photos_path,notice: "更新しました"
    else
      render :new
    end
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path
  end

  private
  
  def photo_params
    params.require(:photo).permit(:content, :image, :image_cache)
  end
end
