require 'faker'

# First, create an admin user
admin_user = User.create!(
  email: 'admin@yopmail.com',
  password: '123456',
  password_confirmation: '123456'
)

# Create 10 students and associate them with the admin user
10.times do
  Student.create!(
    name: Faker::Name.name,
    subject: Faker::Educator.subject,
    marks: rand(50..100),  # Random marks between 50 and 100
    user: admin_user       # Associate each student with the admin user
  )
end

puts "Seed data successfully created!"
