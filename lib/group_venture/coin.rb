class GroupVenture::Coin
  attr_accessor :name, :price, :v, :mc, :url

  def self.scrape_coins
    coins = []
    coins << self.scrape_bitcoin
    #coins << self.scrape_ether


  end

  def self.scrape_bitcoin
    url = "https://coinmarketcap.com/currencies/bitcoin/"
    doc = Nokogiri::HTML(open(url))
    coin = self.new
    coin.name =  doc.search("h1.details-panel-item--name").text
    coin.price = doc.search("span.h2.text-semi-bold.details-panel-item--price__value").text
    coin.mc = doc.search("div.coin-summary-item-detail").first.text.strip
    coin
    
  end
end
