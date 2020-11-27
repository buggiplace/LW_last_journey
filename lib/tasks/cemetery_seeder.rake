require 'open-uri'
require 'nokogiri'

namespace :cemetery do
  desc 'seeding cmeeteries from url' # run in terminal rake cemetery:seed
  task seed: :environment do
    @base_url = "https://friedhoefe.trauer.de/Branchenbuch/Alle%20Friedh%c3%b6fe/-/"
    1.times do |n|

      url = "#{@base_url}#{n+1}"
      html_file = open(url).read
      html_doc = Nokogiri::HTML(html_file)

      html_doc.search('.panelInnerWrapper').each do |element|
        street = element.search(".adressWrapper").search("span")[1].text.strip
        zip_city = element.search(".adressWrapper").search("span")[2].text.strip
        p zip = zip_city.split[0]
        p city = zip_city.split[1]
        # p address = element.search(".adressWrapper").text.strip.gsub(/(\s|&lt;br&gt;)/, " ").split.join(" ")
        p name = element.search(".PanelBBEntryTitle").text.strip.gsub(/(\s|&lt;br&gt;)/, " ").split.join(" ")
        # Location.create(address: address, name: name)
      end
    end
  end
end
