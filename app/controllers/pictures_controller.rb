class PicturesController < ApplicationController
  before_action :set_picture_type, only: :upload

  def upload
    return if params[:uploadFileObj].blank?
    
    if @pictureType == :event
      @picture = EventPicture.new(qquuid: params[:qquuid])
      @picture.uploaded_file = params[:uploadFileObj]
      @picture.save
    end
  end

  def show
    @picture = EventPicture.find(params[:id])
    send_data @picture.data, :filename => @picture.filename, :type => @picture.content_type
  end

  def delete
    @picture = EventPicture.find_by(qquuid: params[:qquuid]).destroy
  end

  private
  
  def set_picture_type
    fileTypeExts = params[:fileTypeExts].split(",")
    @pictureType = fileTypeExts.pop(1).first.to_sym
  end
end
