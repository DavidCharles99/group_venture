class GroupVenture::Scraper
  

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
