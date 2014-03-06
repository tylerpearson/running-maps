# Scripts to generate maps of the most popular running routes in a city

## Setup

Install the gems these scripts use with `bundle install`.

## Usage

### `results-scrape.rb`

First we need to gather all the public runs on RunKeeper for a city. This goes through the results page for the city and saves the URL for each page to a file.

**Usage:** Update the URL and path for the RunKeeper results page to scrape and output location. Run the script with `ruby results-scrape.rb`.

### `routes-scrape.rb`

Now that we have all the public pages' URLs, we need to extract the JSON embedded in the HTML on each page that contains the route the person followed during their run.

**Usage:** Update the paths to where the data should be loaded and output. Run the script with `ruby routes-scrape.rb`.

### `generate-gpx.rb`

Lastly, to load the data into QGIS, I formatted the scraped routes' JSON into a QGIS file. This script could easily be modified to generate GeoJSON or anything else you'd prefer to work with.

**Usage:** Update the paths to where the data should be loaded and output. Run the script with `ruby generate-gpx.rb`.

## Examples

These scripts were used to gather the data needed to generate running maps for Chapel Hill, Raleigh, and Durham. I created the maps in QGIS, but the data could easily be used anywhere else (for example, [loaded on an interactive map](https://github.com/tylerpearson/where-people-run-triangle-data)).

- [Visualizing where people run in Chapel Hill, Durham, and Raleigh](http://www.newmediacampaigns.com/blog/visualizing-most-popular-running-routes-in-chapel-hill-durham-and-raleigh)

### Chapel Hill

![Chapel Hill](http://i.imgur.com/AgKVSbr.jpg)

### Durham

![Durham](http://i.imgur.com/OI8Fls5.jpg)

### Raleigh

![Raleigh](http://i.imgur.com/Kp0vIsc.jpg)

## License

MIT