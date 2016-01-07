class Story < ActiveRecord::Base
  # for the author of a story
  belongs_to :user

  has_many :edits
end