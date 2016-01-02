# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(
    name: "Example User",
    email: "examplexx@railstutorial.org",
    academy: "control and computer",
       phone:"14423123412",
    password: "foobar",
    password_confirmation: "foobar",
    admin: true);

User.create!(  
    name: "craigzkh",
    email: "craigzkh@163.com",
    academy: "control and computer",
    phone:"18600764188",
    password: "123456",
    password_confirmation: "123456",
    admin: true)
 
99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    academy= "control and computer",
    phone= "14423123412",
    password = "password"
    
    User.create!(
        name: name,
        email: email,
        academy: academy,
        phone: phone,
        password: password,
        password_confirmation: password
    )
    
end

50.times do |n|
    name = "team-#{n+1}"
    introduce = "team-#{n+1} is good"
    ltnum = 5
    nownum = 1
    ccode= "#223321"
    
    Group.create!(
        name: name,
        introduce: introduce,
        ltnum: ltnum,
        nownum: nownum,
        ccode: ccode
    )
end