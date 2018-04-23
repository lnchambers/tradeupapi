# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# def tax_type_format(tax_type)
#   if tax_type == "Not-for-Profit"
#     return 1
#   else
#     return 0
#   end
# end
#
# def name_format(name)
#   if name.nil?
#     return "No Information"
#   else
#     return name
#   end
# end
#
# def address_checker(name)
#   addresses.each do |a|
#     return a[1] if a[0] == name
#   end
# end
#
# def addresses
#   [["Aims Community College",
#   "5401 20th St, Greeley, CO 80634"],
#
#   ["Arapahoe Community College",
#   "5900 S Santa Fe Dr, Littleton, CO 80120"],
#
#   ["Colorado Mountain College",
#   "802 Grand Ave, Glenwood Springs, CO 81601"],
#
#   ["Community College of Aurora",
#   "710 Alton Way, Denver, CO 80230"],
#
#   ["Community College of Denver",
#   "800 Curtis Street, Denver, CO 80204"],
#
#   ["Front Range Community College",
#   "4616 S Shields St, Fort Collins, CO 80526"],
#
#   ["Lamar Community College",
#   "2401 S Main St, Lamar, CO 81052"],
#
#   ["Morgan Community College",
#   "920 Barlow Rd, Fort Morgan, CO 80701"],
#
#   ["Northeastern Junior College",
#   "100 College Ave, Sterling, CO 80751"],
#
#   ["Otero Junior College",
#   "1802 Colorado Ave, La Junta, CO 81050"],
#
#   ["Pikes Peak Community College",
#   "5675 S Academy Blvd, Colorado Springs, CO 80906"],
#
#   ["Pueblo Community College",
#   "900 W Orman Ave, Pueblo, CO 81004"],
#
#   ["Red Rocks Community College",
#   "13300 W 6th Ave, Lakewood, CO 80228"],
#
#   ["Trinidad State Junior College",
#   "600 Prospect St, Trinidad, CO 81082"],
#
#   ["Colorado Northwestern Community College",
#   "2801 W 9th St, Craig, CO 81625"]]
# end
#
# FastestCSV.open("./db/data/Degrees_Awarded_to_Post-Secondary_Graduates_in_Colorado.csv") do |csv|
#   fields = csv.shift
#   i = 1
#   while values = csv.shift
#     puts "Seeding degree #{i}"
#     i += 1
#     if values[2].to_i == 4
#       puts "lol no"
#     else
#       institution = Institution.find_or_create_by!(name: values[1], type_of_institution: values[2].to_i, tax_type: tax_type_format(values[5]), address: address_checker(values[1]))
#       program = Program.find_or_create_by!(name: name_format(values[-2]))
#       Catalog.find_or_create_by(institution: institution, program: program)
#       Graduation.create!(institution: institution, program: program, year: values[0], max_age: values[10], min_age: values[9], gender: values[11], ethnicity: values[12], residency: values[-6].to_i, degree_level: values[13])
#     end
#   end
# end
#
# FastestCSV.open("./db/data/Enrollment_Demographics_for_Post-Secondary_Graduates_in_Colorado.csv") do |csv|
#   fields = csv.shift
#   i = 1
#   while values = csv.shift
#     puts "Seeding enrollment #{i}"
#     i += 1
#     if values[2].to_i == 4
#       puts "lol no"
#     else
#       institution = Institution.find_or_create_by!(name: values[1], type_of_institution: values[2].to_i, tax_type: tax_type_format(values[5]), address: address_checker(values[1]))
#       program = Program.find_or_create_by!(name: name_format(values[-2]))
#       Catalog.find_or_create_by(institution: institution, program: program)
#       Enrollment.create!(institution: institution, program: program, year: values[0], max_age: values[10], min_age: values[9], gender: values[11], ethnicity: values[12], residency: values[-6].to_i, degree_level: values[13])
#     end
#   end
# end
#
# FastestCSV.open("./db/data/zip_codes_states.csv") do |csv|
#   fields = csv.shift
#   i = 1
#   while values = csv.shift
#     puts "Seeding County Zips #{i}"
#     i += 1
#     values[-1] = "Not Found" if values[-1].nil?
#     county = County.find_or_create_by!(name: values[-1])
#     Zip.find_or_create_by!(county: county, city: values[-3], state: values[-2], code: values[0])
#   end
# end
#
# raw_trade_school_data.each do |i|
#   puts "Seeding Trade Schools"
#   Institution.find_or_create_by!(name: i[:name], type_of_institution: 0, address: "#{i[:address]}, Denver, CO 80202")
# end

FastestCSV.open('./db/data/2010_Urban_Area_to_ZIP_Code_Tabulation_Area_(ZCTA)_Relationship_File.csv') do |csv|
  fields = csv.shift
  i = 1
  while values = csv.shift
    puts "Seeding zip ##{i}"
    i += 1
    Zip.create!(code: values[2], ua: values[0])
  end
end

FastestCSV.open("./db/data/ua_to_msa_conversion_data.csv") do |csv|
  fields = csv.shift
  i = 1
  while values = csv.shift
    puts "Seeding MSA and UA codes: #{i}"
    i += 1
    msa = Msa.create!(code: values[2])
    zip = Zip.find_by(ua: values[0])
    ua = Ua.create!(code: values[0], msa: msa, zip: zip)
  end
end
