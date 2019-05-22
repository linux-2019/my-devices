module DevicesHelper
  def expand_mac(mac)
    return mac.split(':').map { |oct| (oct.length == 2 ? oct : "0#{oct}") }.join(':')
  end
end
