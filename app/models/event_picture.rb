# == Schema Information
#
# Table name: event_pictures
#
#  id           :integer          not null, primary key
#  event_id     :integer
#  filename     :string
#  content_type :string
#  data         :binary
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  qquuid       :string
#

class EventPicture < ApplicationRecord
  belongs_to :event, optional: :true

  def uploaded_file=(incoming_file)
    self.filename     = incoming_file.original_filename
    self.content_type = incoming_file.content_type
    self.data         = incoming_file.read
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
