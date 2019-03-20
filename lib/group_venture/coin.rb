class GroupVenture::Coin
  attr_accessor :name, :price, :mc, :url, :amount
  @@coins = []
  def initialize
    @@coins << self
    self.amount = 0
  end

  def self.all
    @@coins
  end

  def self.find_by_name(coin_name)
    all.detect {|coin| coin.name == coin_name}
  end

end
