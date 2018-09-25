# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

response = HTTParty.get("http://quotesondesign.com/wp-json/posts?filter[orderby]=ID&filter[posts_per_page]=30")
total_pages = response.headers["x-wp-totalpages"]

puts 'Please wait untill all quotes get imported from http://quotesondesign.com'

1.upto(total_pages.to_i) do |page_index|
  puts "Importing page number #{page_index} of quotes."
  response = HTTParty.get("http://quotesondesign.com/wp-json/posts?filter[orderby]=ID&filter[posts_per_page]=30&page=#{page_index}")
  results = JSON.parse(response.body)

  results.each do |quote|
    Quote.create(title: quote["title"], content: quote["content"], link: quote["link"])
  end
end
