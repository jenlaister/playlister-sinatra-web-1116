class Artist < ActiveRecord::Base

  extend Slug::ClassMethod
  include Slug::InstanceMethod

  has_many :songs
  has_many :genres, through: :songs


end
