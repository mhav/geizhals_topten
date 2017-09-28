class GeizhalsTopTen::CLI

  def call

    (day,month,year,hour,minutes) = format_date()

    puts "Geizhals Top 10 on #{day}/#{month}/#{year} #{hour}:#{minutes}"
    puts '---------------------------------'
    list_topten
    menu
    goodbye
  end

  def list_topten
    puts <<-DOC.gsub /^\s*/, ''
     1. Samsung Galaxy S8 G950F schwarz in Handys ohne Vertrag ab € 780,95
     2. Apple iPhone 8 64GB grau in Handys ohne Vertrag ab € 579,--
     3. Apple iPhone 7 32GB schwarz in Handys ohne Vertrag ab € 428,50
     4. Samsung Galaxy S7 G930F 32GB schwarz in Handys ohne Vertrag ab € 257,90
     5. Huawei P10 Lite Dual-SIM 32GB/4GB schwarz in Handys ohne Vertrag ab € 309,37
     6. Apple iPhone SE 32GB grau in Handys ohne Vertrag ab € 369,14
     7. Apple iPhone 6 32GB grau in Handys ohne Vertrag ab € 307,90
     8. Samsung Galaxy A5 A520F schwarz in Handys ohne Vertrag ab € 565,--
     9. Samsung Galaxy S8+ G955F schwarz in Handys ohne Vertrag ab € 937,32
    10. Apple MacBook Air 13.3", Core i5-5350U (Z0UU) in Notebooks ab € 937,32
    DOC
  end

  def menu
    input = nil
    while input != 'exit'
      puts ''
      puts 'Enter the number of the item you would like to see the details of:'
      input = gets.strip.downcase()
      case input
        when '1'
          puts 'More info on item 1'
        when '2'
          puts 'More info on item 2'
        when '3'
          puts 'More info on item 3'
        when 'list'
          list_topten
        else
          puts 'Not a valid option, type a number, "list" or "exit":'
      end
    end
  end

  def goodbye
    puts "See you next time!"
  end

  def format_date
    time    = Time.now()
    day     = "#{time.day}"
    month   = "#{time.month}"
    year    = "#{time.year}"
    hour    = "#{time.hour}"
    minutes = "#{time.min}"

    day     = '0' + hour if hour.length < 2
    month   = '0' + hour if hour.length < 2
    hour    = '0' + hour if hour.length < 2
    minutes = '0' + minutes if minutes.length < 2

    return day, month, year, hour, minutes
  end

end