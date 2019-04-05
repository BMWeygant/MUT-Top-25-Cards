require 'pry'
require 'open-uri'
require 'nokogiri'
require_relative 'card.rb'

class Scraper

BASE_URL = "https://www.muthead.com/19/players"

  def self.scrape_muthead
      card_array = []

      doc = Nokogiri::HTML(open(BASE_URL))
      doc.css("tr.even, tr.odd").each do |details|
        #binding.pry
        name = details.css("a").text.strip
        program = details.css("span").text.strip
        ovr = details.css(".col-overall").text.strip
        position = details.css(".col-position").text.strip
        price = details.css(".col-price").text.strip
        #href =  details.css("a").attribute("href").value
        card_array << {
          name: name,
          program: program,
          ovr: ovr,
          position: position,
          price: price
        }
      end
      Card.create_from_array(card_array)
    end
end
