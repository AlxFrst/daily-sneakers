#Create size table
start_time = Time.now

Sneaker.destroy_all

p "Cette seed prend un temps monstrueux, donc va prendre un café :)"

#UPCOMING RELEASE
p "------------------"
p "UPCOMING RELEASE"
p "------------------"
upcoming_url = "https://www.sneakerjagers.com/en/releases"
upcoming_doc = Nokogiri::HTML(URI.open(upcoming_url))
upcoming_doc.css("#content").css(".flex.items-center.space-x-4").each do |sneaker|
  upcoming_link = "https://www.sneakerjagers.com#{sneaker.attributes["href"].value}"
  upcoming_details = Nokogiri::HTML(URI.open(upcoming_link))
  brand = upcoming_details.css(".divide-y").css("tr").css("td")[1].text
  model = upcoming_details.css(".text-2xl.font-semibold.tracking-tight.font-brand.line-clamp-2").text.gsub(upcoming_details.css(".divide-y").css("tr").css("td")[2].text, "").squeeze.strip
  color = upcoming_details.css(".divide-y").css("tr").css("td")[4].text
  reference = upcoming_details.css(".divide-y").css("tr").css("td")[0].text
  img_url = "https://www.sneakerjagers.com#{upcoming_details.css("#content").css(".aspect-w-1.aspect-h-1").css(".rounded-xl").css("img")[0].attribute("src").value}"
  if upcoming_details.css(".divide-y").css("tr").css("td")[6].text.match(/\d{2}\/\d{2}\/\d{4}/)
    unordoned_date = upcoming_details.css(".divide-y").css("tr").css("td")[6].text.split("/")
    date = "#{unordoned_date[1]}-#{unordoned_date[0]}-#{unordoned_date[2]}"
    release_date = Date.parse(date)
    if Sneaker.where(reference: reference) == []
      Sneaker.create!(brand: brand, model: model, color: color, reference: reference, imgurl: img_url, release: release_date)
      p "#{brand} #{model} #{reference} created !"
    else
      p "#{brand} #{model} #{reference} already exists"
    end
  else
    today = Date.today
    today_month = today.strftime("%m")
    today_year = today.strftime("%Y")
    release_date = Date.parse("#{upcoming_details.css(".absolute.w-11.left-4.top-4").css("span")[0].text}/#{today_month}/#{today_year}")
    if Sneaker.where(reference: reference) == []
      Sneaker.create!(brand: brand, model: model, color: color, reference: reference, imgurl: img_url, release: release_date)
      p "#{brand} #{model} #{reference} created !"
    else
      p "#{brand} #{model} #{reference} already exists"
    end
  end
end

p "------------------"
p "UPCOMING RELEASE FINISHED!"
p "------------------"
p "ALL UPCOMING RELEASE CREATION"

#ALREADY RELEASED
released_pages = 1
released_url = "https://lussofootwear.com/popular/mens?page=#{released_pages}"
released_doc = Nokogiri::HTML(URI.open(released_url))
released_total_pages = released_doc.css(".list-reset").css("li")[-2].text.to_i

released_total_pages.times do |page|
  p "------------------"
  p "Page #{page + 1}/#{released_total_pages}"
  p "------------------"
  current_page = Nokogiri::HTML(URI.open("https://lussofootwear.com/popular/mens?page=#{page + 1}"))
  current_page.css(".aero-listing-card").each do |sneaker|
    released_links = "https://lussofootwear.com#{sneaker.attribute("href").value}"
    released_details = Nokogiri::HTML(URI.open(released_links))
    brand = released_details.css(".aero-product__manufacturer").text.strip
    model = released_details.css(".aero-product__title").text.strip.gsub(brand, "").strip
    color = released_details.css(".aero-tab").css(".text-left").css("span")[15].text
    reference = released_details.css(".aero-tab").css(".text-left").css("span")[7].text.strip
    img_url = released_details.css(".relative").css(".w-full.block.mx-auto.overflow-x-scroll.scrolling-touch.whitespace-nowrap.align-top").css("img")[0].attribute("src").value
    released_date = Date.parse(released_details.css(".aero-tab").css(".text-left").css("span")[3].text.strip) rescue nil

    if Sneaker.where(reference: reference) == []
      Sneaker.create!(brand: brand, model: model, color: color, reference: reference, imgurl: img_url, release: released_date)
      p "#{brand} #{model} #{reference} created !"
    else
      p "#{brand} #{model} #{reference} already exists"
    end
  end
end
p "------------------"
p "SEED FINISH | #{Sneaker.count} sneakers created"
p "------------------"

p "GETTING PRICES"
Price.destroy_all

Sneaker.all.each do |sneaker|
  kelkt = "https://www.klekt.com/all?search=#{sneaker.reference}"
  kelktdoc = Nokogiri::HTML(URI.open(kelkt))
  if kelktdoc.css(".c-product-pod").length == 0
    puts "No price found for #{sneaker.reference} | KLEKT"
    sneaker.destroy
  else
    puts "Price found for #{sneaker.reference} | KLEKT"
    detail_kelkt = "https://www.klekt.com#{kelktdoc.css(".c-product-pod").first.css(".pod-link").attr("href").value}"
    detail_kelktdoc = Nokogiri::HTML(URI.open(detail_kelkt))
    detail_kelktdoc.css(".c-price-point").each do |price|
      if (price.css("span")[1].text && price.css("span")[2])
        size = price.css("span")[1].text.gsub(/[^\d\.]/, "").to_f
        price = price.css("span")[2].text.gsub(/[^\d\.]/, "").to_f
        new_price = Price.new(market: "klekt", timestamp: Time.now, size: size, price: price, sneaker_id: sneaker.id)
        new_price.save
      end
    end
  end

  kikikickz = "https://kikikickz.com/search?type=product&q=#{sneaker.reference}"
  kikikickzdoc = Nokogiri::HTML(URI.open(kikikickz, "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36"))
  if kikikickzdoc.css(".product__item--container").length == 0
    puts "No price found for #{sneaker.reference} | KIKIKICKZ"
    sneaker.destroy
  else
    puts "Price found for #{sneaker.reference} | KIKIKICKZ"
    detail_kikikickz = "https://kikikickz.com#{kikikickzdoc.css(".product__item__link--container").attr("href").value}"
    detail_kikikickzdoc = Nokogiri::HTML(URI.open(detail_kikikickz))
    detail_kikikickzdoc.css(".product--price-page").css(".select__custom--value").each do |price|
      if (price.text.split("-")[1] && price.text.split("-")[2])
        size = price.text.split("-")[1].gsub(" US ", "").strip.to_f
        price = price.text.split("-")[2].strip.gsub("€", "").to_f
        new_price = Price.new(market: "kikikickz", timestamp: Time.now, size: size, price: price, sneaker_id: sneaker.id)
        new_price.save
      end
    end
  end
end

end_time = Time.now

p "------------------"
p "SEED FINISH "
p " time elapsed: #{(end_time - start_time) / 60} minutes"
p " #{Sneaker.count} sneakers created"
p " #{Price.count} prices created}"
p "Total database entries: #{Sneaker.count + Price.count}"
p "------------------"
