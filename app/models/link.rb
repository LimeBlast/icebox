class Link < ActiveRecord::Base
  validates :url, :title, :body, presence: true
end
