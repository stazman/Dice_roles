require 'nokogiri'
require 'pry'
require 'open-uri'


# test_array = [{'title' => 'how to text', 'content' => 'just do it'}], {'title' => 'how to email', 'content' => 'just do it, too'}]

class WikihowTechTopics::Scraper

    @title_ary = []

    def self.get_title_ary(title_url)
        
        title_url = 'https://www.wikihow.com/Category:Computers-and-Electronics'
        
        home_page = Nokogiri::HTML(open(title_url))
        
        home_page.css('.text').text.each do |title|
            
        @title_ary << title
        end
    end
    binding.pry

end



# def self.scraped_content
    #     content_array = []


    #     content_url.css(<div class="thumbnail").each do |article|
    
    #     article_content = {
    #         :content_url => article.css( <a href="//www.wikihow.com/Change-Alexa%27s-Name">).text
    #     }
    #     end
    #     content_array << article_content
    # end

        # <div class="text"><p>How to <br><span>Change Alexa's Name</span></p></div>

        # <div class="thumbnail d-height d-width">
        # <a href="//www.wikihow.com/Change-Alexa%27s-Name">
        # <div id="bodycontents">

