User.destroy_all
Pair.destroy_all


User.create!(first_name:"Anja", last_name:"Rupnik", email:"anja@email.com", password: "123456", admin: true)
User.create!(first_name:"Floris", last_name:"Meininger", email:"floris@email.com", password: "123456", admin: false)
User.create!(first_name:"Anthony", last_name:"Chamberlin", email:"anthony@email.com", password: "123456", admin: false)
User.create!(first_name:"Banja", last_name:"Rupnik", email:"banja@email.com", password: "123456", admin: true)
User.create!(first_name:"Beloris", last_name:"Meinungal", email:"beloris@email.com", password: "123456", admin: false)
User.create!(first_name:"Banthony", last_name:"Chamberlox", email:"banthony@email.com", password: "123456", admin: false)
User.create!(first_name:"Frodo", last_name:"Baggins", email:"mdf@email.com", password: "123456", admin: false)
User.create!(first_name:"Mr", last_name:"T", email:"something@email.com", password: "123456", admin: false)
User.create!(first_name:"Andre", last_name:"The Giant", email:"robin@email.com", password: "123456", admin: false)
User.create!(first_name:"Mr", last_name:"Blobby", email:"lala@email.com", password: "123456", admin: false)
