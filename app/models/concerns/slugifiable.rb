class Slug < ActiveRecord::Base

  module InstanceMethod
    def slug
      self.name.downcase.gsub(" ","-")
    end
  end

  module ClassMethod
    def find_by_slug(input)
      self.all.find {|instance| instance.slug == input}
    end
  end

end
