# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  lyrics     :text
#  track_type :string(255)      default("regular")
#  album_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base
  belongs_to :album
  has_one :band, through: :album, source: :band
end
