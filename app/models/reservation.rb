# == Schema Information
#
# Table name: reservations
#
#  id              :integer          not null, primary key
#  event_id        :integer          not null
#  user_id         :integer          not null
#  expected_people :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_reservations_on_event_id  (event_id)
#  index_reservations_on_user_id   (user_id)
#

class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
end
