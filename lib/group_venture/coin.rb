class GroupVenture::Coin
  attr_accessor :name, :price, :mc, :url, :amount
  @@coins = []
  def initialize
    @@coins << self
  end
  def self.all
    @@coins
  end
  def self.find_by_name(name)
    all.detect {|name| name}
  end

end
