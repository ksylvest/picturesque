class Image < ActiveRecord::Base

  def slug
    name.parameterize
  end

end
