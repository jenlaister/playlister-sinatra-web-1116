class SongGenre < ActiveRecord::Base

  extend Slug::ClassMethod
  include Slug::InstanceMethod

  belongs_to :song
  belongs_to :genre

end
