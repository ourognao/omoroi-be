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
    if params[:picture_type].to_sym == :event
      @pictures = EventPicture.where(event_id: params[:id])
    end
  end

  def update
    if params[:picture_type].to_sym == :event
      EventPicture.where(qquuid: params[:qquuids]).update_all(event_id: params[:event_id])
      @pictures = EventPicture.where(event_id: params[:event_id])
    end
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
