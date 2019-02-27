#controller
class GroupVenture::CLI
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
    @forge = GroupVenture::Coin.scrape_coins
    @forge.each do |coin|
      puts "#{coin.name}  #{coin.price}"
    end
  end

  def list
    puts "       "
    puts "bitcoin"
    puts "       "
    puts "xrp"
    puts "       "
    puts "ether"
    puts "       "
  end

  def menu
    input = nil
    while input != "exit"
      puts "enter the name of the coin for more information or type exit:"
      input = gets.strip.downcase
      case input

      when "bitcoin"
        puts "#{GroupVenture::Coin.all[0].mc}"
        puts "type y/n to buy"
        usin = gets.strip.downcase
        if usin == "y"
        @@counter1 += 1
        puts "you have #{@@counter1} bitcoin"
        list
      else
        list
        end

      when "ether"
        puts "#{GroupVenture::Coin.all[1].mc}"
        puts "type y/n to buy"
        usin = gets.strip.downcase
        if usin == "y"
          @@counter2 += 1
          puts "you have #{@@counter2} ethereum"
          list
        else
          list
        end

      when "xrp"
        puts "#{GroupVenture::Coin.all[2].mc}"
        puts "type y/n to buy"
        usin = gets.strip.downcase
        if usin == "y"
          @@counter3 += 1
          puts "you have #{@@counter3} ripple"
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

   def good_bye
     puts "seeya!"
   end
 end
