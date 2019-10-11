class Image < ApplicationRecord
  acts_as_taggable
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp,
                                            message: 'Invalid url',
                                            multiline: true }
end
