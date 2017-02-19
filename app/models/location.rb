class Location < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 255 }
  validates :area, presence: true
end
