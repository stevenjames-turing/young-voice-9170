require 'rails_helper'

RSpec.describe Professor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :specialty}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:students).through(:professor_students)}
  end

  before(:each) do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")
    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
    @prof_studend_1 = ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
    @prof_studend_2 = ProfessorStudent.create(student_id: @harry.id, professor_id: @hagarid.id)
    @prof_studend_3 = ProfessorStudent.create(student_id: @harry.id, professor_id: @lupin.id)
    @prof_studend_4 = ProfessorStudent.create(student_id: @malfoy.id, professor_id: @hagarid.id)
    @prof_studend_5 = ProfessorStudent.create(student_id: @malfoy.id, professor_id: @lupin.id)
    @prof_studend_6 = ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
  end

  describe 'class methods' do
    describe '#sort_alphabetically' do
      it 'returns all professors sorted alphabetically by name' do
        expect(Professor.sort_alphabetically).to eq([@lupin, @hagarid, @snape])
      end
    end
  end

  describe 'instance methods' do
    describe '.students_avg_age' do
      it 'returns average age of all students for a particular professor' do
        expect(@snape.students_avg_age).to eq(11)
      end
    end
  end
end
