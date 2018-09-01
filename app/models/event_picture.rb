# == Schema Information
#
# Table name: event_pictures
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  qquuid     :string
#  original   :text
#  thumbnail  :text
#
require "image_processing/mini_magick"
class EventPicture < ApplicationRecord
  belongs_to :event, optional: :true

  def uploaded_file=(incoming_file)
    content_type  = incoming_file.content_type
    data          = MiniMagick::Image.read(incoming_file.read)

    original      = ImageProcessing::MiniMagick.source(data).resize_to_fit(800, 600).call
    thumbnail     = ImageProcessing::MiniMagick.source(data).resize_to_fill(80, 80).call

    originalBase64  = Base64.strict_encode64(MiniMagick::Image.new(original.path).to_blob)
    thumbnailBase64 = Base64.strict_encode64(MiniMagick::Image.new(thumbnail.path).to_blob)

    self.original = "data:#{content_type};base64,#{originalBase64}"
    self.thumbnail = "data:#{content_type};base64,#{thumbnailBase64}"
  end

  def filename=(new_filename)
    write_attribute("filename", sanitize_filename(new_filename))
  end
  
  private
  
  def sanitize_filename(filename)
    just_filename = File.basename(filename)
    just_filename.gsub(/[^\w\.\-]/, '_')
  end
end
