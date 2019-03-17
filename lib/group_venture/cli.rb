class GroupVenture::CLI

  def call
    GroupVenture::Scraper.scrape_coins
    top_icos
    menu
    good_bye
  end

  def top_icos
    puts "top ICO's"
    forge = GroupVenture::Coin.all
    forge.each do |coin|
      puts "#{coin.name}  #{coin.price}"
    end
  end

  def menu
    input = nil
    data = GroupVenture::Coin.all
    while input != "exit"
      puts "enter the name of the coin for more information or type 'exit':"
      input = gets.strip.downcase
      case input

      when "bitcoin"
        phrase = data[0].mc.gsub("\n\n\n", "\n-------------------------\n")
        puts "#{phrase}"
        puts "type 'y'/'n' to buy"
        usin = gets.strip.downcase
        if usin == "y"
        coin_obj1 = GroupVenture::Coin.find_by_name("Bitcoin")
        coin_obj1.amount1 += 1
        puts "you have #{coin_obj1.amount1} bitcoin, to see total balance type 'wallet'"
        puts "------------------------------------------------------"
        list
      else
        list
        end

      when "ether"
        phrase = data[1].mc.gsub("\n\n\n", "\n-------------------------\n")
        puts "#{phrase}"
        puts "type 'y'/'n' to buy"
        usin = gets.strip.downcase
        if usin == "y"
          coin_obj2 = GroupVenture::Coin.find_by_name("Ether")
          coin_obj2.amount2 += 1
          puts "you have #{coin_obj2.amount2} ethereum, to see total balance type 'wallet'"
          puts "------------------------------------------------------"
          list
        else
          list
        end

      when "xrp"
        phrase = data[2].mc.gsub("\n\n\n", "\n-------------------------\n")
        puts "#{phrase}"
        puts "type 'y'/'n' to buy"
        usin = gets.strip.downcase
        if usin == "y"
          coin_obj2 = GroupVenture::Coin.find_by_name("Ether")
          coin_obj2.amount2 += 1
          puts "you have #{coin_obj2.amount2} ripple, to see total balance type 'wallet'"
          puts "------------------------------------------------------"
          list
        else
          list
        end

      when "wallet"
        puts "bitcoin wallet =  [#{amount1}]"
        puts "ethereum wallet = [#{amount2}]"
        puts "ripple wallet =   [#{amount3}]"
      end

     end
   end

   def list
     puts "Bitcoin"
     puts "(BTC)"
     puts  ""
     puts  ""
     puts  "Ethereum"
     puts  "(ETH)"
     puts  ""
     puts  ""
     puts  "XRP"
     puts  "(XRP)"

   end

   def good_bye
     puts "seeya!"
   end
 end
