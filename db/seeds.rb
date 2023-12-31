# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

r1 = Role.create({ name: 'Regular', description: 'Can read items' })
r2 = Role.create({ name: 'Admin', description: 'Can perform any CRUD operation on any resource' })

u1 = User.create({ email: 'aus@example.com', password: '123456789', role_id: r1.id })
u2 = User.create({ email: 'aus_admin@example.com', password: '123456789', role_id: r2.id })

j1 = Job.create({JobName: 'SDE', JobDescription: 'Software Development Engineer'})
j2 = Job.create({JobName: 'QA', JobDescription: 'Automated QA Developer'})