#Create size table
Sneaker.destroy_all
Price.destroy_all

p "Cette seed prend un temps monstrueux, donc va prendre un café :)"

#UPCOMING RELEASE
p "------------------"
p "UPCOMING RELEASE"
p "------------------"
upcoming_pages = 1
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
p "UPCOMING RELEASE FINISHED"
p "------------------"
p "ALL UPCOMING RELEASE CREATION"

#ALREADY RELEASED
released_pages = 1
released_url = "https://lussofootwear.com/popular/mens?page=#{released_pages.to_s}"
released_doc = Nokogiri::HTML(URI.open(released_url))
released_total_pages = released_doc.css(".list-reset").css("li")[-2].text.to_i

released_total_pages.times do |page|
  page + 1
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
