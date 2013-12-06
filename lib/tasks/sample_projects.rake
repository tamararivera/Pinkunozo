namespace :db do
  desc "Fill database with sample projects"
  task populate: :environment do
    Project.create!(name: "Proyecto Fondef",
                    description: "Este es un proyecto fabuloso")
  end
end