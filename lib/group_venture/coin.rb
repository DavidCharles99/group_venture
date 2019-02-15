class GroupVenture::Coin
  attr_accessor :name, :price, :mc, :url

  def self.scrape_coins
    coins = []
    coins << self.scrape_bitcoin
    coins << self.scrape_ether
    coins << self.scrape_xrp

    coins


  end

  def self.scrape_bitcoin
    url = "https://coinmarketcap.com/currencies/bitcoin/"
    doc = Nokogiri::HTML(open(url))
    coin = self.new
    coin.name =  doc.search("h1.details-panel-item--name").text
    coin.price = doc.search("span.h2.text-semi-bold.details-panel-item--price__value").text
    coin.mc = doc.search("table.table.cmc-table-striped.cmc-cc-summary-table").text
    coin
  end

  def self.scrape_ether
    url = "https://coinmarketcap.com/currencies/ethereum/"
    doc = Nokogiri::HTML(open(url))
    coin = self.new
    coin.name =  doc.search("h1.details-panel-item--name").text
    coin.price = doc.search("span.h2.text-semi-bold.details-panel-item--price__value").text
    coin.mc = doc.search("table.table.cmc-table-striped.cmc-cc-summary-table").text
    coin
  end

  def self.scrape_xrp
    url = "https://coinmarketcap.com/currencies/ripple/"
    doc = Nokogiri::HTML(open(url))
    coin = self.new
    coin.name =  doc.search("h1.details-panel-item--name").text
    coin.price = doc.search("span.h2.text-semi-bold.details-panel-item--price__value").text
    coin.mc = doc.search("table.table.cmc-table-striped.cmc-cc-summary-table").text
    coin
  end

end
