#Create size table
Sneaker.destroy_all
Price.destroy_all

# Sneakers to database
page = 1
url = "https://www.klekt.com/all?page=#{page.to_s}"
3.times do |i|
  require "Nokogiri"
  require "open-uri"

  doc = Nokogiri::HTML(URI.open(url))
  doc.css(".pod-link").each do |item|
    link = item.attributes["href"].value
    detail_link = "https://www.klekt.com/#{link}"
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
      if Sneaker.where(reference: sku) == []
        sneaker = Sneaker.new(brand: brand, model: model, year: year, reference: sku)
        sneaker.save!
      else
        sneaker = Sneaker.where(reference: sku)[0]
      end
      p sneaker.id
      price = Price.new(timestamp: Time.now, price: size_price.to_f, size: size_name.to_f, market: 'Klekt')
      price.sneakers_id = sneaker.id
      price.save!
    end
  end
  page += 1
end
