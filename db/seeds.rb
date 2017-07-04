10.times do |blog| # The blog variable is the same thing as the one in "title"
                   # Every time this loop iterates, #blog will hold the number of the iteration
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "TEST TEST TEST"
    )
end

puts "10 blog posts created"

5.times do |skill|
  Skill.create!(
    title: "Rails #{skill}",
    percent_utilized: 15
    )
end

puts "5 skills created"

9.times do |portfolio|
  Portfolio.create!(
    title: "Portfolio title #{portfolio}",
    subtitle: "The subtitle",
    body: "Let the bodies hit the floor",
    main_image: "https://placeholdit.co//i/600x400",
    thumb_image: "https://placeholdit.co//i/250x150" 
    )
end
puts "9 portfolio items created"
