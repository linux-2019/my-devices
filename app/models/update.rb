require "resolv"

class Update < ApplicationRecord
  validates :ip_address, format: { with: Resolv::IPv4::Regex }, presence: true
  belongs_to :device
end
