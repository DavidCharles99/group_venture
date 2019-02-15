#controller
class GroupVenture::CLI

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
        puts "#{@coin_mc}"
        puts "type y/n to buy"
        usin = gets.strip.downcase
        if usin == "y"
          puts "hey ya!"
        else
          top_icos
        end

      when "ether"
        puts "#{@coin_mc}"
        puts "type y/n to buy"
        usin = gets.strip.downcase
        if usin == "y"
          puts "hey ya!"
        else
          top_icos
        end

      when "xrp"
        puts "#{@coin_mc}"
        puts "type y/n to buy"
        usin = gets.strip.downcase
        if usin == "y"
          puts "hey ya!"
        else
          top_icos
        end

      when "list"
        top_icos
      end

     end
   end

   def good_bye
     puts "seeya!"
   end
 end
