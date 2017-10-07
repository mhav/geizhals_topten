class GeizhalsTopTen::Category
  # A section has a name, a link and a top ten list

  attr_accessor :name, :link, :top_ten_list1

  @@all = []

  def initialize(name, link)
    @name = name
    @link = link
    @@all << self
  end

  def list_sections
    @@all.each do |section|
      puts "Name: #{section.name} - Link: #{section.link}"
    end
  end

  def self.all
    @@all
  end

  def get_top_ten_list(link)
    puts "Listing Top 10 for category #{self.name}"
    page = Nokogiri::HTML(open(link))
    section_top10 = page.css('ol.t10 li.t10i')
    c = 1
    section_top10.each do |element|
      product = element.search('a.t10a', 'a.t10p b span.gh_price').map(&:text)
      link = element.search('a.t10a').map {|e| e['href']}[0]
      product[0].strip!
      puts "#{c}. #{product[0]} - #{product[1]} # https://www.geizhals.at/#{link}"
      c += 1
    end
  end

end