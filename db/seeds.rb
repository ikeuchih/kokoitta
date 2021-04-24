User.create!(username:  "hinano",
             email: "hinano@gmail.com",
             password:              "hinano0313",
             password_confirmation: "hinano0313")
             

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(username:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
end


Tag.create([
    { tag_name: 'Korea'},
    { tag_name: 'Thailand'},
    { tag_name: 'China'},
    { tag_name: 'Malaysia'},
    { tag_name: 'Singapore'},
    { tag_name: 'Indonesia'},
    { tag_name: 'Philippines'},
    { tag_name: 'Bali'},
    { tag_name: 'Cebu'},
    { tag_name: 'Maldives'},
    { tag_name: 'Mongolia'},
    { tag_name: 'Taiwan'},
    { tag_name: 'HongKong'},
    { tag_name: 'Macau'},
    { tag_name: 'America'},
    { tag_name: 'Canada'},
    { tag_name: 'Iceland'},
    { tag_name: 'Italy'},
    { tag_name: 'Austria'},
    { tag_name: 'Switzerland'},
    { tag_name: 'Sweden'},
    { tag_name: 'Spain'},
    { tag_name: 'Denmark'},
    { tag_name: 'Germany'},
    { tag_name: 'Norway'},
    { tag_name: 'Hungary'},
    { tag_name: 'Finland'},
    { tag_name: 'France'},
    { tag_name: 'Belgium'},
    { tag_name: 'Poland'},
    { tag_name: 'Portugal'},
    { tag_name: 'Romania'},
    { tag_name: 'Russia'},
])


Spottag.create([
    { name: 'Dinner'},
    { name: 'Lunch'},
    { name: 'Breakfarst'},
    { name: 'Cafe'},
    { name: 'Sea'},
    { name: 'Scenery'},
    { name: 'Tourism'},
    { name: 'Activity'},
    { name: 'Amusement park'},
    { name: 'Museum'},
    { name: 'Remains'}
])