#controller
class GroupVenture::CLI
  attr_accessor :counter1, :counter2, :counter3
  @@counter1 = 0
  @@counter2 = 0
  @@counter3 = 0
  def call
    top_icos
    menu
    good_bye
  end

  def top_icos
    puts "top ICO's"
    @coins = GroupVenture::Coin.scrape_coins
    @coins.each do |coin|
      @coin_mc = coin.mc
      puts "#{coin.name}  #{coin.price}"
    end
  end


  def menu
    input = nil
    while input != "exit"
      puts "enter the name of the coin for more information or type exit:"
      input = gets.strip.downcase
      case input

      when "bitcoin"
        puts "#{GroupVenture::Coin.scrape_coins[0].mc}"
        puts "type y/n to buy"
        usin = gets.strip.downcase
        if usin == "y"
        @@counter1 += 1
        puts "you have #{@@counter1} bitcoin"
        else
          top_icos
        end

      when "ether"
        puts "#{GroupVenture::Coin.scrape_coins[1].mc}"
        puts "type y/n to buy"
        usin = gets.strip.downcase
        if usin == "y"
          @@counter2 += 1
          puts "you have #{@@counter2} ethereum"
        else
          top_icos
        end

      when "xrp"
        puts "#{GroupVenture::Coin.scrape_coins[2].mc}"
        puts "type y/n to buy"
        usin = gets.strip.downcase
        if usin == "y"
          @@counter3 += 1
          puts "you have #{@@counter3} ripple"
        else
          top_icos
        end

      when "wallet"
        puts "bitcoin wallet =  [#{@@counter1}]"
        puts "ethereum wallet = [#{@@counter2}]"
        puts "ripple wallet =   [#{@@counter3}]"
      end

     end
   end

   def good_bye
     puts "seeya!"
   end
 end
