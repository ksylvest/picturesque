class Image < ActiveRecord::Base

  def slug
    self.name.parameterize
  end

end
