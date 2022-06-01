#Create size table
Sneaker.destroy_all
Price.destroy_all

# Sneakers database
require "Nokogiri"
require "open-uri"

# UPCOMING RELEASE
coming_pages = 1
coming_url = "https://moresneakers.com/releases?group=in_stock&page=#{coming_pages.to_s}"

coming_doc = Nokogiri::HTML(URI.open(coming_url))

coming_doc.css(".releases-container .product-card").each do |product|
  link = "https://moresneakers.com" + product.css("a").attr("href").value
  page = Nokogiri::HTML(URI.open(link))
  details = page.css("section")
  brand = details.css("p").css("a")[0].text
  model = details.css("p").css("a")[1].text
  colors = details.css("p")[2].css("strong").text
  sku = details.css("p")[3].css("strong").text
  gender = details.css("p")[5].css("strong").text
  p img_url = "lol"
end

# ALREADY RELEASED
