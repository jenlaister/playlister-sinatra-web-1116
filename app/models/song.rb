class Song < ActiveRecord::Base

  extend Slug::ClassMethod
  include Slug::InstanceMethod

  belongs_to :artist
  has_many :genres, through: :song_genres
  has_many :song_genres

end
