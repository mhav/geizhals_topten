class GeizhalsTopTen::CLI

  def call

    (day,month,year,hour,minutes) = format_date()

    get_categories

    puts "Geizhals Top 10 on #{day}/#{month}/#{year} #{hour}:#{minutes}"
    puts '---------------------------------'
    list_categories
    main_menu
  end

  def get_categories
    url = 'https://www.geizhals.at'
    page = Nokogiri::HTML(open(url))
    categories_section = page.css('div.ovhid h2.katt a')
    categories_section.each do |element|
      link = url + element['href'].gsub('.', '')
      GeizhalsTopTen::Category.new(element.text.strip.to_s, link)
    end
  end

  def list_categories
    x = 1
    GeizhalsTopTen::Category.all.each do |category|
      puts "#{x}. #{category.name} - #{category.link}"
      x += 1
    end
  end

  def main_menu()
    while true
      puts ''
      puts 'Enter the number of the section you would like to see, type "list" to list the categories and "exit" to leave:'
      input = gets.strip.downcase()
      case input
        when '1'
          get_list(GeizhalsTopTen::Category.all[input.to_i - 1])
        when '2'
          get_list(GeizhalsTopTen::Category.all[input.to_i - 1])
        when '3'
          get_list(GeizhalsTopTen::Category.all[input.to_i - 1])
        when '4'
          get_list(GeizhalsTopTen::Category.all[input.to_i - 1])
        when '5'
          get_list(GeizhalsTopTen::Category.all[input.to_i - 1])
        when '6'
          get_list(GeizhalsTopTen::Category.all[input.to_i - 1])
        when '7'
          get_list(GeizhalsTopTen::Category.all[input.to_i - 1])
        when '8'
          get_list(GeizhalsTopTen::Category.all[input.to_i - 1])
        when '9'
          get_list(GeizhalsTopTen::Category.all[input.to_i - 1])
        when '10'
          get_list(GeizhalsTopTen::Category.all[input.to_i - 1])
        when '11'
          get_list(GeizhalsTopTen::Category.all[input.to_i - 1])
        when '12'
          get_list(GeizhalsTopTen::Category.all[input.to_i - 1])
        when '13'
          get_list(GeizhalsTopTen::Category.all[input.to_i - 1])
        when 'list'
          list_categories
        when 'exit'
          goodbye
          exit(0)
        when 'e'
          goodbye
          exit(0)
        else
          puts 'This is not a valid option, type a number or "exit":'
      end
    end
  end

  def get_list(category)
    category.get_top_ten_list(category.link)
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