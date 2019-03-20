class GroupVenture::CLI

  def call
    GroupVenture::Scraper.scrape_coins
    top_icos
    menu
    good_bye
  end

  def top_icos
    num = 0
    puts "top ICO's"
    forge = GroupVenture::Coin.all
    forge.each do |coin|
      puts "#{num += 1}  #{coin.name}  #{coin.price}"
    end
  end


  def menu
    input = nil
    data = GroupVenture::Coin.all
    while input != "exit"
      puts "enter the number next to the coin for more information or type 'exit':"
      input = gets.strip.downcase
      case input

      when "1"
        phrase = data[0].mc
        puts "#{phrase}"
        puts "type 'y'/'n' to buy"
        usin = gets.strip.downcase
        if usin == "y"
        coin_obj1 = GroupVenture::Coin.find_by_name("Bitcoin(BTC)")
        coin_obj1.amount += 1
        puts "you have #{coin_obj1.amount} bitcoin, to see total balance type 'wallet'"
        puts "------------------------------------------------------"
        list
      else
        list
        end

      when "2"
        phrase = data[1].mc
        puts "#{phrase}"
        puts "type 'y'/'n' to buy"
        usin = gets.strip.downcase
        if usin == "y"
          coin_obj2 = GroupVenture::Coin.find_by_name("Ethereum(ETH)")
          coin_obj2.amount += 1
          puts "you have #{coin_obj2.amount} ethereum, to see total balance type 'wallet'"
          puts "------------------------------------------------------"
          list
        else
          list
        end

      when "3"
        phrase = data[2].mc
        puts "#{phrase}"
        puts "type 'y'/'n' to buy"
        usin = gets.strip.downcase
        if usin == "y"
          coin_obj3 = GroupVenture::Coin.find_by_name("XRP(XRP)")
          coin_obj3.amount += 1
          puts "you have #{coin_obj2.amount} ripple, to see total balance type 'wallet'"
          puts "------------------------------------------------------"
          list
        else
          list
        end

      when "wallet"
        puts "bitcoin wallet =  [#{GroupVenture::Coin.find_by_name("Bitcoin(BTC)").amount}]"
        puts "ethereum wallet = [#{GroupVenture::Coin.find_by_name("Ethereum(ETH)").amount}]"
        puts "ripple wallet =   [#{GroupVenture::Coin.find_by_name("XRP(XRP)").amount}]"
      end

     end
   end

   def list
     puts "1  Bitcoin(BTC)"
     puts "2  Ethereum(ETH)"
     puts "3  XRP(XRP)"
   end

   def good_bye
     puts "seeya!"
   end
 end
