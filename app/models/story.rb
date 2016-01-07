class Story < ActiveRecord::Base
  # for the author of a story
  belongs_to :user, :class_name => 'User'

  has_many :edits
end
