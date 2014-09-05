class Stop < ActiveRecord::Base
  belongs_to :route
  has_many :settings
end