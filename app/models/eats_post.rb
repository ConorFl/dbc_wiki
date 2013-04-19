class EatsPost < ActiveRecord::Base
  has_many :comments
end
