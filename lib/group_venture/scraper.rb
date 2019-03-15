class GroupVenture::Scraper
  # Refactor so that the Coin class keeps track of all of its own coins
  # There should be no class variables in Scraper
  # Coin should have a class variable
  # When a new instance of Coin is created, it should be 'persisted' to the class variable
  def self.scrape_coins
      self.scrape_bitcoin
      self.scrape_ether
      self.scrape_xrp
    end

  def self.scrape_bitcoin
    doc = Nokogiri::HTML(open("https://coinmarketcap.com/currencies/bitcoin/"))
    coin = GroupVenture::Coin.new
    coin.name =  doc.search("h1.details-panel-item--name").text
    coin.price = doc.search("span.h2.text-semi-bold.details-panel-item--price__value").text
    coin.mc = doc.search("table.table.cmc-table-striped.cmc-cc-summary-table").text
    coin
  end

  def self.scrape_ether
    url = "https://coinmarketcap.com/currencies/ethereum/"
    doc = Nokogiri::HTML(open(url))
    coin = GroupVenture::Coin.new
    coin.name =  doc.search("h1.details-panel-item--name").text
    coin.price = doc.search("span.h2.text-semi-bold.details-panel-item--price__value").text
    coin.mc = doc.search("table.table.cmc-table-striped.cmc-cc-summary-table").text
    coin
  end

  def self.scrape_xrp
    url = "https://coinmarketcap.com/currencies/ripple/"
    doc = Nokogiri::HTML(open(url))
    coin = GroupVenture::Coin.new
    coin.name =  doc.search("h1.details-panel-item--name").text
    coin.price = doc.search("span.h2.text-semi-bold.details-panel-item--price__value").text
    coin.mc = doc.search("table.table.cmc-table-striped.cmc-cc-summary-table").text
    coin
  end
end
