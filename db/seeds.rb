# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# 1.times do
#   interest = InterestArea.create!(name: "Garçom") do
#     Job.create!(interest_area_id: interest, description: '22 hora', address: "Rua joão", salary: 22)
# end

# 1.times do
#   interest = InterestArea.create!(name: "Pedreiro") do
#     Job.create!(interest_area_id: interest, description: '22 hora', address: "Rua joão", salary: 22)
# end

InterestArea.create!(name: "Garçom")
InterestArea.create!(name: "Pedreiro")
InterestArea.create!(name: "Jardineiro")
InterestArea.create!(name: "Diarista")
InterestArea.create!(name: "BarMan")
InterestArea.create!(name: "Pintor")
InterestArea.create!(name: "Capinteiro")
InterestArea.create!(name: "Segurança")
InterestArea.create!(name: "Recepcionista")
InterestArea.create!(name: "Motorista")
