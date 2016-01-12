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
    admin: true
);
 
99.times do |n|
    name =  Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    academy= "control and computer"
    phone= "14423123412"
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


30.times do |n|
    name = "team-#{n+1}"
    introduce = "team-#{n+1} is good"
    ltnum = 5
    nownum = 0
    
    ccode = ""
    if n<10
        ccode= "091M4021H-2"
    elsif n<20
        ccode= "092M3022H"    
    else
        ccode = "093M2222H"
    end
    
    Group.create!(
        name: name,
        introduce: introduce,
        ltnum: ltnum,
        nownum: nownum,
        ccode: ccode
    )
end

30.times do |n|
    authority = 1
    status = 1
    user_id = n+1
    group_id = n+1 
    
    Menber.create!(
        authority: authority,
        status: status,
        user_id: user_id, 
        group_id: group_id
    )
end


Menber.create!(authority: 0,status: 1,user_id: 31, group_id: 1)
Menber.create!(authority: 0,status: 1,user_id: 32, group_id: 1)
Menber.create!(authority: 0,status: 1,user_id: 33, group_id: 1)
Menber.create!(authority: 0,status: 1,user_id: 34, group_id: 2)
Menber.create!(authority: 0,status: 1,user_id: 35, group_id: 2)
Menber.create!(authority: 0,status: 1,user_id: 36, group_id: 3)
Menber.create!(authority: 0,status: 1,user_id: 37, group_id: 4)
Menber.create!(authority: 0,status: 1,user_id: 38, group_id: 5)
Menber.create!(authority: 0,status: 0,user_id: 39, group_id: 2, message: 'i am good at UI')
Menber.create!(authority: 0,status: 0,user_id: 40, group_id: 2, message: 'i am good at program')
