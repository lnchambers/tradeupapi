# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def tax_type_format(tax_type)
  if tax_type == "Not-for-Profit"
    return 1
  else
    return 0
  end
end

def name_format(name)
  if name.nil?
    return "No Information"
  else
    return name
  end
end

FastestCSV.open("./db/Degrees_Awarded_to_Post-Secondary_Graduates_in_Colorado.csv") do |csv|
  fields = csv.shift
  i = 1
  while values = csv.shift
    puts "Seeding degree #{i}"
    i += 1
    if values[2].to_i == 4
      puts "lol no"
    else
      institution = Institution.find_or_create_by!(name: values[1], type_of_institution: values[2].to_i, tax_type: tax_type_format(values[5]))
      program = Program.find_or_create_by!(name: name_format(values[-2]))
      Graduation.create!(institution: institution, program: program, year: values[0], max_age: values[10], min_age: values[9], gender: values[11], ethnicity: values[12], residency: values[-5], degree_level: values[13])
    end
  end
end

FastestCSV.open("./db/Enrollment_Demographics_for_Post-Secondary_Graduates_in_Colorado.csv") do |csv|
  fields = csv.shift
  i = 1
  while values = csv.shift
    puts "Seeding enrollment #{i}"
    i += 1
    if values[2].to_i == 4
      puts "lol no"
    else
      institution = Institution.find_or_create_by!(name: values[1], type_of_institution: values[2].to_i, tax_type: tax_type_format(values[5]))
      program = Program.find_or_create_by!(name: name_format(values[-2]))
      Enrollment.create!(institution: institution, program: program, year: values[0], max_age: values[10], min_age: values[9], gender: values[11], ethnicity: values[12], residency: values[-5], degree_level: values[13])
    end
  end
end
