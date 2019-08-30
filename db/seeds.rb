# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.create(email: "test@test.com", password: "asdfasdf",
  password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")

AdminUser.create(email: "admin@test.com", password: "password",
  password_confirmation: "password", first_name: "Admin", last_name: "User")

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user: @user, overtime_request: 2.5)
end

puts "100 posts have been created."

100.times do |audit_log|
  AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 6.days))
end

puts "100 audit logs have been created."
