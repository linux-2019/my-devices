class Device < ApplicationRecord
  validates :mac, format: { with: /\A([0-9A-Fa-f]{1,2}[-:]){5}([0-9A-Fa-f]{1,2})\z/ },
  presence: true, uniqueness: true
  has_many :updates
  has_many :stats

  before_save :downcase_mac
  
  def downcase_mac
    self.mac.downcase!
  end
  
  def last_ip
    last_update = self.updates.last
    last_update ? last_update.ip_address : ""
  end

  def last_stats
    self.stats.last || Stat.new
  end
end
