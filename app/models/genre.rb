class Genre < ActiveRecord::Base

  extend Slug::ClassMethod
  include Slug::InstanceMethod

  has_many :artists, through: :songs
  has_many :songs, through: :song_genres
  has_many :song_genres


end
