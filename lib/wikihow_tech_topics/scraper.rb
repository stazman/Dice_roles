require 'nokogiri'
require 'open-uri'
require 'pry'

class WikihowTechTopics::Scraper

    # def initialize(title=nil, content=nil, home_page=nil, title_array = nil, content_array = nil)
    #     @title_array = title_array
    #     @content_array = content_array
    #     @home_page = home_page
    #     @@all << self
    # end

    def self.scraped_title_array
        home_page = Nokogiri::HTML(open("https://www.wikihow.com/Category:Selecting-and-Buying-a-Computer"))
        title_array = []
        home_page.css('.text').each do |title_info|
        info_for_title_array = title_info.css('span').text
        title_array << info_for_title_array
        end
        title_array.pop(5)
        title_array
    end

    def self.scraped_content_array
        url = "https://www.wikihow.com/Category:Selecting-and-Buying-a-Computer"
        home_page = Nokogiri::HTML(open(url))

        content_urls = home_page.css(".thumbnail").children.css("a").map { |content_link| content_link.attribute("href").text }

        http_added = content_urls.map { |content_url| "https:" + content_url }
        
        url_array_sidebar_articles_removed = http_added.pop(4)

        http_added.map do |complete_content_url| 
            content_pages_to_scrape = Nokogiri::HTML(open(complete_content_url))
        
        final_scraped_content = content_pages_to_scrape.css('div.steps').map { |full_content|
                full_content.css("b").text }

        final_scraped_content
        end
    end

    def self.all
        @@all
    end

    basic_computers_page = WikihowTechTopics::Scraper.new
    basic_computers_page.home_page = "https://www.wikihow.com/Category:Selecting-and-Buying-a-Computer"
    basic_computers_page.title_array = self.scraped_title_array
    basic_computers_page.content_array = self.scraped_content_array

end

# make url instances and put them in @@all
# url instances are connected to urls scraped from website
#     title urls
#     content urls

# can the instances be shoveled into model.all?