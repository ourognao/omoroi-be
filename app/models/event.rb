# == Schema Information
#
# Table name: events
#
#  id                     :bigint(8)        not null, primary key
#  user_id                :integer          not null
#  title                  :text
#  location_jp            :string
#  access_jp              :string
#  date                   :date
#  start_time             :string
#  end_time               :string
#  cost                   :integer
#  capacity               :integer
#  threshold              :integer
#  explanation_jp         :text
#  positions              :string           is an Array
#  tags                   :string           is an Array
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  section                :string           is an Array
#  explanation_en         :text
#  location_en            :string
#  access_en              :string
#  event_location_name_jp :string
#  event_location_name_en :string
#
# Indexes
#
#  index_events_on_date     (date)
#  index_events_on_tags     (tags)
#  index_events_on_user_id  (user_id)
#

class Event < ActiveRecord::Base
  has_many :reservations
  has_many :event_pictures
  belongs_to :user
  
  attr_accessor :picture_ids
  
  scope :sortedByAsc,  -> { all.reorder("date ASC") }
  scope :sortedByDesc, -> { all.reorder("date DESC") }
end
