#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'json'
require 'colored'

route_ids = []

# change to how far back in pagination we should scrape
# some cities don't go too far back
(1..37).each do |page|
  url = "http://runkeeper.com/search/routes/#{page}?distance=&lon=-78.899&location=durham%2C+nc&activityType=RUN&lat=35.994"
  #url = "http://runkeeper.com/search/routes/#{page}?distance=&lon=-79.056&location=chapel+hill%2C+nc&activityType=RUN&lat=35.913"
  #url = "http://runkeeper.com/search/routes/#{page}?distance=&lon=-78.638&location=raleigh%2C+nc&activityType=RUN&lat=35.78"

  puts "#{page}. #{url}".green
  data = Nokogiri::HTML(open(url))
  results = data.css('.resultListItem')
  results.each do |result|
    link = result.attribute('link')
    puts link
    route_ids << link
  end

  # Sleep for a bit to be respecful of RunKeeper and act as a normal user would
  sleep [1.1,2.2,3.3].sample
end

File.open("pages/durham.json","w") do |f|
  f.write(route_ids.to_json)
end