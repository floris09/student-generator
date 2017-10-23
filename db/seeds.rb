User.destroy_all

User.create!(email:"anja@email.com", password: "123456", admin: true)
User.create!(email:"floris@email.com", password: "123456", admin: false)
User.create!(email:"anthony@email.com", password: "123456", admin: false)
User.create!(email:"banja@email.com", password: "123456", admin: true)
User.create!(email:"beloris@email.com", password: "123456", admin: false)
User.create!(email:"banthony@email.com", password: "123456", admin: false)
User.create!(email:"mdf@email.com", password: "123456", admin: false)
User.create!(email:"something@email.com", password: "123456", admin: false)
User.create!(email:"robin@email.com", password: "123456", admin: false)
User.create!(email:"batman@email.com", password: "123456", admin: false)
