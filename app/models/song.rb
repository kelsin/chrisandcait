class Song < ActiveRecord::Base
  acts_as_list

  default_scope :order => 'songs.position'
end
