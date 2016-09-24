# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: 'user@boost.co.nz', first_name: 'ray', last_name: 'tuth', password: '123123123', password_confirmation: '123123123')

@user = AdminUser.create!(email: 'yar@boost.co.nz', first_name: 'yar', last_name: 'htut', password: '123123123', password_confirmation: '123123123')

@project = Project.create(title: "infinity", description: "DNZ system stories")
Project.create(title: "infinity", description: "DNZ system stories")
Project.create(title: "infinity", description: "NetLib system stories")
Project.create(title: "infinity", description: "Lib system stories")

UserProject.create(user_id: @user.id, project_id: 1)
UserProject.create(user_id: @user.id, project_id: 2)
