# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |topic|
  Topic.create!(
    title: "Topic #{topic}",
    )
end

puts "3 topics created"

10.times do |blog|
  Blog.create!(
    title: "Title #{blog}",
    body: "Body body body",
    topic_id: Topic.all.pluck(:id).sample
    )
end

puts "10 blogs created"

5.times do |skill|
  Skill.create!(
    title: "Skill: #{skill}",
    percent_utilized: 15
    )
end

8.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio Title #{portfolio_item}",
    subtitle: "subtitle",
    body: "body",
    main_image: "https://placeholdit.co/i/544x544?&bg=123123&fc=ffffff&text=123",
    thumb_image: "https://placeholdit.co/i/244x244?&bg=123123&fc=ffffff&text=123"
    )
end


1.times do |portfolio_item|
  Portfolio.create!(
    title: "Portfolio Title #{portfolio_item}",
    subtitle: "angular",
    body: "body",
    main_image: "https://placeholdit.co/i/544x544?&bg=123123&fc=ffffff&text=123",
    thumb_image: "https://placeholdit.co/i/244x244?&bg=123123&fc=ffffff&text=123"
    )
end

puts "9 Portfolio items created
"