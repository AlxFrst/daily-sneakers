#Create size table
Sneaker.destroy_all
Price.destroy_all

# Sneakers database
require "Nokogiri"
require "open-uri"

# ALREADY RELEASED
released_pages = 1
released_url = "https://lussofootwear.com/popular/mens?page=#{released_pages.to_s}"
released_doc = Nokogiri::HTML(URI.open(released_url))
released_total_pages = released_doc.css(".list-reset").css("li")[-2].text.to_i
released_doc.css(".aero-listing-card").each do |sneaker|
  released_links = "https://lussofootwear.com#{sneaker.attribute("href").value}"
  released_details = Nokogiri::HTML(URI.open(released_links))
  brand = released_details.css(".aero-product__manufacturer").text.strip
  model = released_details.css(".aero-product__title").text.strip.gsub(brand, "").strip
  color = released_details.css(".aero-tab").css(".text-left").css("span")[15].text
  reference = released_details.css(".aero-tab").css(".text-left").css("span")[7].text.strip
  img_url = released_details.css(".relative").css(".w-full.block.mx-auto.overflow-x-scroll.scrolling-touch.whitespace-nowrap.align-top").css("img")[0].attribute("src").value
  p released_date = Date.parse(released_details.css(".aero-tab").css(".text-left").css("span")[3].text.strip)
  Sneaker.create!(brand: brand, model: model, color: color, reference: reference, imgurl: img_url, release: released_date)
end
