class Story < ActiveRecord::Base
  has_one :author
  has_many :users
end
