class Image < ActiveRecord::Base
  belongs_to :type
  has_attached_file :img
end
