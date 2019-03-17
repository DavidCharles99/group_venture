class GroupVenture::Coin
  attr_accessor :name, :price, :mc, :url, :amount1, :amount2, :amount3
  @@coins = []
  def initialize
    @@coins << self
    self.amount1 = 0
    self.amount2 = 0
    self.amount3 = 0
  end
  def self.all
    @@coins
  end
  def self.find_by_name(name)
    all.detect {|name| name}
  end

end
