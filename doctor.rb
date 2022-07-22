require 'sqlite3'
# Le Wagon gives this DB to you
DB = SQLite3::Database.new('doctors.sqlite')

class Doctor
  def initialize(attributes = {})
    @id = attributes[:id] || attributes['id']
    @name = attributes[:name] || attributes['name']
    @age = attributes[:age] || attributes['age']
    @specialty = attributes[:specialty] || attributes['specialty']
  end

  def self.all
    DB.results_as_hash = true
    results =  DB.execute("SELECT * FROM doctors")
    results.map do |result|
      Doctor.new(result)
    end
  end

  def save
    # if the instance has an id
      # update
    # else
      # inserting into the DB
      puts "Inserting into the db..."
      DB.execute("INSERT INTO doctors (name, age) VALUES (?, ?)", 'Bill; DROP TABLE doctors', 42)
      # give the instance, the newly created ID
      p DB.last_insert_row_id

  end

end


# Doctor.new(name: whatever_the_user_gave_me_from_the_view)
# Doctor.new('name' => whatever_the_user_gave_me_from_the_view)
p Doctor.all
# Doctor.find(19)
bill = Doctor.new(name: 'bill')
bill.save
p bill
# bill.destroy
