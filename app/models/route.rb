class Route < ActiveRecord::Base
  has_many :stops
  has_many :settings

  def self.types
    self.uniq.pluck(:type)
  end
end