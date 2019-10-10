class Image < ApplicationRecord
  validates :url, presence: true, format: { with: %r{(^https://)[a-zA-Z0-9/\_\-\.]+(\.jpg|\.png)$},
                                            message: 'Invalid url',
                                            multiline: true }
end
