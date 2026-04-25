# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Seed roles
%w[owner tenant].each { |role| Role.find_or_create_by!(name: role) }

# Seed owner
owner = User.find_or_create_by!(email: "owner@example.com") do |u|
  u.password = "password123"
  u.password_confirmation = "password123"
end
owner.add_role :owner unless owner.has_role?(:owner)

# Seed tenant
tenant = User.find_or_create_by!(email: "tenant@example.com") do |u|
  u.password = "password123"
  u.password_confirmation = "password123"
end
tenant.add_role :tenant unless tenant.has_role?(:tenant)

puts "Seeded #{User.count} users with roles."
