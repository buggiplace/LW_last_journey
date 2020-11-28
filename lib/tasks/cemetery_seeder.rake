require 'open-uri'
require 'nokogiri'

require 'csv'

# run in terminal rake cemetery:seed to see the data being seeded
namespace :cemetery do
  desc 'seeding cmeeteries from url'
  task seed: :environment do
    @base_url = "https://friedhoefe.trauer.de/Branchenbuch/Alle%20Friedh%c3%b6fe/-/"
    2.times do |n|
      url = "#{@base_url}#{n + 1}"
      html_file = open(url).read
      html_doc = Nokogiri::HTML(html_file)

      html_doc.search('.panelInnerWrapper').each do |element|
        street = element.search(".adressWrapper").search("span")[1].text.strip
        zip_city = element.search(".adressWrapper").search("span")[2].text.strip
        p zip = zip_city.split[0]
        p city = zip_city.split[1]
        # p address = element.search(".adressWrapper").text.strip.gsub(/(\s|&lt;br&gt;)/, " ").split.join(" ") prev try of scraping not needed anymore
        p name = element.search(".PanelBBEntryTitle").text.strip.gsub(/(\s|&lt;br&gt;)/, " ").split.join(" ")
        # Location.create(address: address, name: name) when TA did not know about the csv yet
      end
    end
  ends
end

# csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
# filepath    = 'address_seed4.csv'

# CSV.open(filepath, 'wb', csv_options) do |csv|
#   csv << [name, street, zip, city]
# end
