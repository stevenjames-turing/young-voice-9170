require 'rails_helper'

RSpec.describe 'professor show page' do 
   
    it 'displays all students for a particular professor' do 
        snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
        harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
        malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
        longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )
        ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
        ProfessorStudent.create(student_id: longbottom.id, professor_id: snape.id)

        visit "/professors/#{snape.id}"

        expect(page).to have_content(harry.name)
        expect(page).to have_content(longbottom.name)
        expect(page).to_not have_content(malfoy.name)
    end
end 