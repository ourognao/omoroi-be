class PicturesController < ApplicationController
  before_action :set_picture_type, only: :upload

  def upload
    return if params[:uploadFileObj].blank?

    if @pictureType == 'event'
      @picture = EventPicture.new(event_id: @id)
      @picture.uploaded_file = params[:uploadFileObj]
      @picture.save
    end
  end

  def show
    @picture = EventPicture.find(params[:id])
    send_data @picture.data, :filename => @picture.filename, :type => @picture.content_type
  end

  private
  
  def set_picture_type
    fileTypeExts = params[:fileTypeExts].split(",")
    @pictureType, @id = fileTypeExts.pop(2)
  end
end
