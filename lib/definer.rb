require 'net/http'
require 'json'
require 'optparse'

class Define
  def define word
    begin
      definition = part_of_speech = example = "not found"
      api_url = "http://api.pearson.com/v2/dictionaries/entries?headword="
      header_uri = URI(api_url.concat(word))
      res = Net::HTTP.get(header_uri);
      my_hash = JSON.parse(res)
      accepted = ['ldoce5','laad3','wordwise']
      my_dict = my_hash['results'].select { |set| (set['datasets'] & accepted).any?}[0]
      part_of_speech = my_dict['part_of_speech'] unless part_of_speech.class== NilClass
      definition = my_dict['senses'][0]['definition'] 
      example = my_dict['senses'][0]['examples'][0]['text'] unless example.class == NilClass 
    rescue
    end

    options = {}

    optparse = OptionParser.new do |opts|

      opts.banner = "Usage: define <word> [options]"

      options[:example] = false
      opts.on( '-e', '--example', 'Shows an example') do
        options[:example] = true
      end

      options[:part_of_speech] = false
      opts.on( '-p', '--part', 'Shows the part of speech') do
        options[:part_of_speech] = true
      end

      opts.on( '-h', '--help', 'Display this screen') do
        puts opts
        exit
      end
    end

    optparse.parse!

    puts "#{word.upcase} : #{definition}" if definition
    puts "Part of Speech : #{part_of_speech}" if options[:part_of_speech]
    puts "Example : #{example}" if options[:example]
  end
end 
