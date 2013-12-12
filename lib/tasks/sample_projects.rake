namespace :db do
  desc "Fill database with sample user and projects"
  task populate: :environment do
    make_users
    make_projects
  end

  def make_users
    User.create!(name: "Tamara Rivera",
                 email: "tamita.rivera@gmail.com",
                 password: "memoria",
                 password_confirmation: "memoria",
                 admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end

  def make_projects
    project = Project.create!(name: "Proyecto Fondef",
                              description: "Este es un proyecto fabuloso")
    project.add_user!(User.first)
  
    99.times do |n|
      name = Faker::Lorem.sentence
      description = Faker::Lorem.paragraph
      project = Project.create!(name: name,
                                description: description)
      project.add_user!(User.first)
      
    end
  end
end