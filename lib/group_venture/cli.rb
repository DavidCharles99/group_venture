class GroupVenture::CLI
  @@counter1 = 0
  @@counter2 = 0
  @@counter3 = 0
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
        @@counter1 += 1
        puts "you have #{@@counter1} bitcoin, to see total balance type 'wallet'"
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
          @@counter2 += 1
          puts "you have #{@@counter2} ethereum, to see total balance type 'wallet'"
          puts "------------------------------------------------------"
          list
        else
          list
        end

      when "xrp"
        coin = GroupVenture::Coin.find_by_name("XRP")
        coin.amount +=1
        phrase = data[2].mc.gsub("\n\n\n", "\n-------------------------\n")
        puts "#{phrase}"
        puts "type 'y'/'n' to buy"
        usin = gets.strip.downcase
        if usin == "y"
          @@counter3 += 1
          puts "you have #{@@counter3} ripple, to see total balance type 'wallet'"
          puts "------------------------------------------------------"
          list
        else
          list
        end

      when "wallet"
        puts "bitcoin wallet =  [#{@@counter1}]"
        puts "ethereum wallet = [#{@@counter2}]"
        puts "ripple wallet =   [#{@@counter3}]"
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
