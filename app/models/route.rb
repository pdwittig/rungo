class Route < ActiveRecord::Base
  has_many :stops

  def self.types
    self.uniq.pluck(:type)
  end
end