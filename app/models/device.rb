class Device < ApplicationRecord
  validates :mac, format: { with: /\A([0-9A-F]{2}[-:]){5}([0-9A-F]{2})\z/ }, presence: true
  has_many :updates
end
