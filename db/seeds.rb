#Create size table
Size.destroy_all
Sneaker.destroy_all
sneakers_us_sizes = [3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5, 12, 12.5, 13, 13.5, 14, 15, 16, 17, 18]
sneakers_eu_sizes = [35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 54.5, 55, 56, 57, 58, 59]
sneakers_uk_sizes = [2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11, 11.5, 12, 12.5, 13, 14, 15, 16, 17]

p "#{sneakers_us_sizes.length} US sizes | #{sneakers_eu_sizes.length} EU sizes | #{sneakers_uk_sizes.length} UK sizes"

sneakers_us_sizes.length.times do |i|
  Size.create(US: sneakers_us_sizes[i], EU: sneakers_eu_sizes[i], UK: sneakers_uk_sizes[i])
  p "Created size US: #{sneakers_us_sizes[i]} | EU: #{sneakers_eu_sizes[i]} | UK: #{sneakers_uk_sizes[i]}"
end

# Sneakers to database
page = 1
url = "https://www.klekt.com/all?page=" + page.to_s
3.times do |i|
  require "Nokogiri"
  require "open-uri"

  doc = Nokogiri::HTML(URI.open(url))
  doc.css(".pod-link").each do |item|
    link = item.attributes["href"].value
    detail_link = "https://www.klekt.com/" + link
    detail_doc = Nokogiri::HTML(URI.open(detail_link))
    details = detail_doc.css(".c-pdp-info")
    sku = details.css("span")[1].text
    brand = detail_doc.css(".u-letter-spacing--normal")[2].text
    model = detail_doc.css(".u-title")[0].text.gsub(brand, "").strip.remove("\n").remove("\t")
    #get year in model like model (2000)
    year = model.match(/\d{4}/)[0]
    model = model.gsub(year, "").strip.remove("\n").remove("\t").remove("(").remove(")").strip

    sizes = detail_doc.css(".c-price-point")
    sizes.each do |size|
      size_name = size.css("span")[0].text.remove("US").remove("\t").remove("\r").strip
      size_price = size.css("span")[2].text.remove("€")
      p "--------------------------"
      p " #{brand} #{model} #{year} #{sku} #{size_name.to_f}"
      instancetest = Size.where(US: size_name.to_f)
      p instancetest
      sneaker = Sneaker.new(brand: brand, model: model, year: year, reference: sku)
      sneaker.size = instancetest.first
      sneaker.save!
    end
  end
  page += 1
end
