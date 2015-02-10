class Link < ActiveRecord::Base
  validates :url, presence: true
end
