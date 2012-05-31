class Image < ActiveRecord::Base
  attr_accessible :data, :key
  validates :data, :presence => true
  validates :key,  :presence => true, :uniqueness => true
end
