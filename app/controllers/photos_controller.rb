class PhotosController < ApplicationController
  def index
    
  end
  
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      render new
    end
    
  end


  private

  def photo_params
    params.require(:photo).parmit([:content, :image])
  end
end
