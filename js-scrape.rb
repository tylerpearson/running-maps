#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'json'
require 'colored'

paths = JSON.parse(File.read('results/durham.json'))

routes = []

paths.each_with_index do |path, index|

  url = "http://runkeeper.com#{path}"

  puts "#{index}. #{url}".blue

  current = ""

  data = Nokogiri::HTML(open(url))

  # this finds the embedded JSON for the route
  data.css('script').each do |script|
      result = script.text.match(/var\s+routePoints\s+=\s+(.*?);/m).to_s
      current = result unless result.length == 0
  end

  route = current[/\[.*?\]/]

  routes << route

  File.open("routes/durham.json","w") do |f|
    f.write(routes.to_json)
  end

  sleep [1.1,2.2,3.3,4.4,5.5,6.6].sample
end