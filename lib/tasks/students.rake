namespace :db do
  desc 'Fill db with sample data'
  task populate_students: :environment do
    benefits = [
        'army',
        'poor family',
        'health status'
    ]
    (benefits.length).times do |i|
      connect = ActiveRecord::Base.connection()
      connect.execute(ActiveRecord::Base.send(:sanitize_sql_array,
                                              "INSERT INTO benefit_categories (benefit_name, meansure, created_at, updated_at) VALUES ('#{benefits[i]}', #{i + 1}, '#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}', '#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}')"))
    end


    faculties = Faculty.all
    faculties.each do |current_faculty|
      students = []
      first_category = []
      second_category = []
      third_category = []
      (Random.rand(10)+3).times do
        student = Student.create!(
                             name: Faker::Name.name,
                             age: 16 + Random.rand(2)
        )
        students << student
        first_category << student
      end

      BenefitCategory.find(1).students = first_category

      (Random.rand(10)+3).times do
        student = Student.create!(
            name: Faker::Name.name,
            age: 16 + Random.rand(2)
        )
        students << student
        second_category << student
      end

      BenefitCategory.find(2).students = second_category

      (Random.rand(10)+3).times do
        student = Student.create!(
            name: Faker::Name.name,
            age: 16 + Random.rand(2)
        )
        students << student
        third_category << student
      end

      BenefitCategory.find(3).students = third_category

      (Random.rand(50) + 100).times do
        student = Student.create!(
            name: Faker::Name.name,
            age: 16 + Random.rand(2)
        )
        students << student
      end
      Faculty.find(current_faculty.id).students = students
    end
  end
end