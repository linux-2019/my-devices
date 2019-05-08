class Device < ApplicationRecord
  validates :mac, format: { with: /\A([0-9A-F]{2}[-:]){5}([0-9A-F]{2})\z/ },
    presence: true, uniqueness: true
  has_many :updates

  before_save :downcase_mac
  
  def downcase_mac
    self.mac.downcase!
  end
end
