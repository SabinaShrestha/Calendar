class Day < ActiveRecord::Base
  belongs_to :month
  has_many :events
end
