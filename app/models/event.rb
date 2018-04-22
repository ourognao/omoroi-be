# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  title       :text
#  location    :string
#  access      :string
#  date        :date
#  start_time  :string
#  end_time    :string
#  cost        :integer
#  capacity    :integer
#  threshold   :integer
#  picture     :string
#  explanation :text
#  positions   :string           is an Array
#  tags        :string           is an Array
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  section     :string           is an Array
#
# Indexes
#
#  index_events_on_date     (date)
#  index_events_on_tags     (tags)
#  index_events_on_user_id  (user_id)
#

class Event < ActiveRecord::Base
  has_many :reservations
  belongs_to :user

  scope :sortedByAsc,  -> { all.sort_by { |event| event[:id] } }
  scope :sortedByDesc, -> { all.sort_by { |event| event[:id] }.reverse }
end
