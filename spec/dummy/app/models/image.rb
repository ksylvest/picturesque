class Image < ApplicationRecord
  def slug
    name.parameterize
  end
end
