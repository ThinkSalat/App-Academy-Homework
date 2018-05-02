# == Schema Information
#
# Table name: people
#
#  id       :bigint(8)        not null, primary key
#  name     :string
#  house_id :integer
#

class Person < ApplicationRecord
  validates :name, :house_id, presence: true
  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House'

end
