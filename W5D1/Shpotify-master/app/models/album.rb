# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  year       :integer
#  live       :boolean          default(FALSE)
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord

  validates_presence_of :title, :band_id

  belongs_to :band,
    class_name: :Band,
    foreign_key: :band_id,
    primary_key: :id

  has_many :tracks,
    class_name: :Track,
    foreign_key: :album_id,
    primary_key: :id

end
