# == Schema Information
#
# Table name: release_emails
#
#  id         :bigint(8)        not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ReleaseEmail < ApplicationRecord
  validates :email, uniqueness: true, allow_nil: false
end
