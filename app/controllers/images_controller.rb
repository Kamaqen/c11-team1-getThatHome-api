class ImagesController < ApplicationController
  def upload
    result = Cloudinary::Uploader.upload(params[:file]) # 'file' is the name of the input field in your form

    render json: { url: result['secure_url'] }
  end
end