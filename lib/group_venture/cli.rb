#controller
class GroupVenture::CLI

  def call
    top_icos
    menu
    good_bye
  end

  def top_icos
    puts "top ICO's"
    @coin = GroupVenture::Coin.scrape_coins
    @coin.each.with_index(1) do |input|
      puts "#{input} #{@coin.name}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "enter the name of the coin for its YLD curve or type exit:"
      input = gets.strip.downcase
      case input

      when "bitcoin"
        puts "[1mnth: 12%] [2mnth: 18%] [3mnth: 12%] [6mnth: 6%] [1yr: 2%]"
        puts "type y/n to buy"
        usin = gets.strip.downcase
        if usin == "y"
          puts "hey ya!"
        else
          top_icos
        end

      when "ether"
        puts "[1mnth: 14%] [2mnth: 8%] [3mnth: 16%] [6mnth: 26%] [1yr: 12%]"
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
