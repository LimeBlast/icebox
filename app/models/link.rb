class Link < ActiveRecord::Base
  validates :url, :title, presence: true
end
