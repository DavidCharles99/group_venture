class GroupVenture::Coin
attr_accessor :name, :price, :mc, :url
@@coins = []
def self.scrape_coins
    @@coins << GroupVenture::Scraper.scrape_bitcoin
    @@coins << GroupVenture::Scraper.scrape_ether
    @@coins << GroupVenture::Scraper.scrape_xrp
    @@coins
  end

  def self.all
    @@coins
  end
end
