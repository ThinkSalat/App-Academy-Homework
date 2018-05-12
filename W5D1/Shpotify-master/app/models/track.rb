# == Schema Information
#
# Table name: tracks
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  ord        :integer
#  lyrics     :text
#  bonus      :boolean          default(FALSE)
#  album_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord

  validates_presence_of :title, :album_id

  belongs_to :album,
    class_name: :Album,
    foreign_key: :album_id,
    primary_key: :id

  has_one :band,
    through: :album,
    source: :band


end
