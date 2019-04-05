require 'pry'
require_relative 'scraper.rb'
class CLI

attr_accessor :card_array

  def initialize
    @card_array = Scraper.scrape_muthead
  end

  def run

    welcome

    card_list

    input = nil
    until input == 'gtfoh'
      input = gets.strip

    card = @card_array[input.to_i - 1]
    if input == 'gtfoh'
     puts "GTFOH then!"
   elsif input.to_i > @card_array.length || input.to_i <= 0
     choose_again
   else
     info_display(card)
     end
   end

  end

  def info_display(hash)
    puts "#{hash[:name]} - #{hash[:program]}
            Position: #{hash[:position]}
            Overall: #{hash[:ovr]}
            Last AH Price: #{hash[:price]}"
    puts ""
    puts "Choose another card, or type 'gtfoh' to exit!"
  end

  def card_list
    @card_array.each_with_index do |card, index|
    puts "#{index+1}. #{card[:name]} - #{card[:program]}"
    end
  end

  def choose_again
    puts "Wtf are you talking about? Try again."
  end

  def welcome
    puts "Welcome!"
    puts "Here is a VERY brief list of the best cards avaialble for Madden Ultimate Team."
    puts "Enter the number next to the corresponding player name to view the cards information."
    puts "To gtfoh, just type 'gtfoh' at anytime."
  end

end
