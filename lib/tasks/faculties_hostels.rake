namespace :db do
  desc 'Fill db with sample data'
  task populate_faculties: :environment do
    5.times do |i|
      hostel_roominess = Random.rand(200) + 100
      Hostel.create!(number: i+1,
                     head_name: Faker::Name.name,
                     roominess: hostel_roominess,
                     number_occupied: hostel_roominess - Random.rand(100))
    end


    faculties = [
        'fict|Faculty of Informatics',
        'ef|Electronics Faculty',
        'pif|Physics Engineering Faculty',
        'lf|Linguistics Faculty',
        'fbt|Faculty of Biotechnology and Bioengineering'
    ]

    (faculties.length).times do |i|
      current_faculty = faculties[i]
      name = current_faculty.split('|')[0]
      full_name = current_faculty.split('|')[1]

      faculty = Faculty.create!(name: name,
                      full_name: full_name,
                      address: Faker::Address.street_address,
                      person: Faker::Name.name)

      hostels = []
      a = (1..5).to_a.shuffle
      (Random.rand(2)+2).times do
        index = a.pop
        hostels << Hostel.find(index)
      end

      faculty.hostels = hostels
    end
  end
end