#!/usr/bin/env ruby

require 'open-uri'
require 'json'
require 'pp'

gpx = <<EOD
<?xml version="1.0" encoding="UTF-8"?>
<gpx
  version="1.1"
  creator="RunKeeper - http://www.runkeeper.com"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns="http://www.topografix.com/GPX/1/1"
  xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd"
  xmlns:gpxtpx="http://www.garmin.com/xmlschemas/TrackPointExtension/v1">
EOD

routes = JSON.parse(File.read('routes/durham.json'))

routes.each_with_index do |route, index|

  if route == nil
    puts index
    next
  end

  route = JSON.parse(route)
  route_gpx = ""
  route_gpx << "<trk>\n"
  route_gpx << "<name>#{index}</name>"
  route_gpx << "<time>#{DateTime.now}</time>"
  route_gpx << "<trkseg>\n"

  route.each do |point|
    route_gpx << "<trkpt lat=\"#{point['latitude']}\" lon=\"#{point['longitude']}\"></trkpt>\n"
  end

  route_gpx << "</trkseg>\n"
  route_gpx << "</trk>\n"

  gpx << route_gpx
end

gpx << "</gpx>"

File.open("gpx/durham.gpx","w") do |f|
  f.write(gpx)
end