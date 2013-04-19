class ResourcePost < ActiveRecord::Base
  has_many :comments
end
